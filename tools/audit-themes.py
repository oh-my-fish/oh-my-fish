#!/usr/bin/env python3
"""Audit OMF themes for Fish 4.x compatibility and availability.

Reads theme metadata from the local OMF packages cache, clones each theme shallowly,
and checks all .fish files using `fish --no-execute`.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import glob
import json
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


def get_themes(packages_dir: Path, pkg_type: str = "all") -> list[tuple[str, str]]:
    packages = []
    for p in sorted(packages_dir.glob("*")):
        if not p.is_file():
            continue
        try:
            content = p.read_text(encoding="utf-8", errors="ignore")
        except Exception:
            continue
        is_theme = "type = theme" in content
        is_plugin = "type = plugin" in content
        if pkg_type == "theme" and not is_theme:
            continue
        if pkg_type == "plugin" and not is_plugin:
            continue
        if not (is_theme or is_plugin):
            continue
        repo = None
        for line in content.splitlines():
            line = line.strip()
            if line.startswith("repository ="):
                repo = line.split("=", 1)[1].strip()
                break
        if repo:
            packages.append((p.name, repo))
    return packages


def audit_theme(name: str, repo_url: str, base_temp_dir: Path, timeout: int = 20) -> dict:
    theme_dir = base_temp_dir / name
    result = {
        "name": name,
        "repo": repo_url,
        "clone_ok": False,
        "syntax_ok": True,
        "error_type": None,
        "errors": [],
        "fish_files_count": 0,
    }

    # Shallow clone
    try:
        cmd = ["git", "clone", "--depth", "1", "--quiet", repo_url, str(theme_dir)]
        proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=timeout)
        if proc.returncode != 0:
            result["error_type"] = "clone_failed"
            result["errors"].append(proc.stderr.decode("utf-8", errors="replace").strip())
            return result
        result["clone_ok"] = True
    except subprocess.TimeoutExpired:
        result["error_type"] = "timeout"
        result["errors"].append(f"Git clone timed out after {timeout}s")
        return result
    except Exception as e:
        result["error_type"] = "exception"
        result["errors"].append(str(e))
        return result

    # Find all .fish files
    fish_files = list(theme_dir.glob("**/*.fish"))
    result["fish_files_count"] = len(fish_files)

    for fish_file in fish_files:
        try:
            chk = subprocess.run(
                ["fish", "--no-execute", str(fish_file)],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                timeout=5,
            )
            if chk.returncode != 0:
                result["syntax_ok"] = False
                rel_path = fish_file.relative_to(theme_dir)
                err_msg = chk.stderr.decode("utf-8", errors="replace").strip()
                result["errors"].append(f"{rel_path}: {err_msg}")
        except Exception as e:
            result["syntax_ok"] = False
            result["errors"].append(f"{fish_file.name}: {e}")

    if not result["syntax_ok"]:
        result["error_type"] = "syntax_error"

    return result


def main():
    parser = argparse.ArgumentParser(description="Audit OMF themes for Fish compatibility")
    parser.add_argument(
        "--packages-dir",
        type=Path,
        default=Path(os.path.expanduser("~/.cache/omf/https___github.com_oh-my-fish_packages-main_master/packages")),
        help="Path to packages-main/packages directory",
    )
    parser.add_argument("--workers", type=int, default=8, help="Parallel clone/check workers")
    parser.add_argument("--type", choices=["theme", "plugin", "all"], default="plugin", help="Package type to audit")
    parser.add_argument("--output", type=Path, default=None, help="Save JSON report to file")
    args = parser.parse_args()

    if not args.packages_dir.exists():
        print(f"Error: packages directory not found at {args.packages_dir}", file=sys.stderr)
        sys.exit(1)

    themes = get_themes(args.packages_dir, args.type)
    print(f"Found {len(themes)} packages (type: {args.type}) to audit in {args.packages_dir}...")

    temp_dir = Path(tempfile.mkdtemp(prefix="omf_audit_"))

    results = []
    try:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as executor:
            future_to_theme = {
                executor.submit(audit_theme, name, repo, temp_dir): name
                for name, repo in themes
            }
            completed = 0
            for future in concurrent.futures.as_completed(future_to_theme):
                completed += 1
                theme_name = future_to_theme[future]
                res = future.result()
                results.append(res)
                status = "✅ OK"
                if not res["clone_ok"]:
                    status = f"❌ CLONE FAIL ({res['error_type']})"
                elif not res["syntax_ok"]:
                    status = "⚠️  SYNTAX ERROR"
                print(f"[{completed:3d}/{len(themes)}] {theme_name:<25} {status}")
    finally:
        shutil.rmtree(temp_dir, ignore_errors=True)

    results.sort(key=lambda x: x["name"])

    # Summary
    total = len(results)
    ok_count = sum(1 for r in results if r["clone_ok"] and r["syntax_ok"])
    clone_fails = [r for r in results if not r["clone_ok"]]
    syntax_fails = [r for r in results if r["clone_ok"] and not r["syntax_ok"]]

    print("\n" + "=" * 60)
    print("AUDIT SUMMARY")
    print("=" * 60)
    print(f"Total themes audited: {total}")
    print(f"Compatible & Healthy: {ok_count} ({ok_count/total*100:.1f}%)")
    print(f"Unreachable / Dead:   {len(clone_fails)}")
    print(f"Syntax Errors:        {len(syntax_fails)}")

    if syntax_fails:
        print("\n" + "-" * 60)
        print("THEMES WITH SYNTAX ERRORS:")
        print("-" * 60)
        for r in syntax_fails:
            print(f"\n👉 {r['name']} ({r['repo']}):")
            for err in r["errors"]:
                for line in err.splitlines()[:5]:
                    print(f"   {line}")

    if clone_fails:
        print("\n" + "-" * 60)
        print("THEMES WITH CLONE/NETWORK FAILURES (DEAD REPOS):")
        print("-" * 60)
        for r in clone_fails:
            print(f"❌ {r['name']:<25} {r['repo']}")

    if args.output:
        args.output.write_text(json.dumps(results, indent=2), encoding="utf-8")
        print(f"\nWrote full report to {args.output}")


if __name__ == "__main__":
    main()
