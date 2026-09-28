#!/usr/bin/env fish
#
# Run the Oh My Fish test suite in an isolated sandbox.
#
# A throwaway HOME (plus XDG_* directories) is created, Oh My Fish is
# installed into it from this checkout, and the smoke tests and fish-spec
# suites run against that installation. The user's real Oh My Fish
# configuration is never read or modified.
#
# Usage: tests/run.fish [spec files...]
#   With no arguments, runs every spec under pkg/{fish-spec,omf}/spec.

set -l repo (cd (dirname (status -f))/..; and pwd)
set -l sandbox (mktemp -d)
set -l return_code 0

function __omf_tests_cleanup --on-event omf_tests_done -V sandbox
  command rm -rf "$sandbox"
end

# Redirect every path Oh My Fish and fish itself may touch into the sandbox.
set -lx HOME "$sandbox"
set -lx XDG_CONFIG_HOME "$sandbox/.config"
set -lx XDG_DATA_HOME "$sandbox/.local/share"
set -lx XDG_CACHE_HOME "$sandbox/.cache"
set -e OMF_PATH
set -e OMF_CONFIG

echo "Sandbox: $sandbox"

if not fish "$repo/bin/install" --local-source="$repo" --noninteractive --yes
  echo "Failed to install Oh My Fish into the sandbox" >&2
  emit omf_tests_done
  exit 1
end

# Every command below runs in a fresh fish that boots from the sandbox
# config, exactly as a user's shell would. A local-source install skips the
# bundle, so `omf install` first fetches the default theme.
set -l smoke_commands "omf install" "omf help" "omf doctor" "omf install apt" "omf remove apt"
for cmd in $smoke_commands
  echo \$ $cmd
  if not fish -c "$cmd"
    echo "Smoke test failed: $cmd" >&2
    set return_code 1
  end
end

set -l specs
for spec in $argv
  # Absolute paths, so they resolve the same way inside the sandboxed shell.
  set specs $specs (cd (dirname $spec); and pwd)/(basename $spec)
end
if test (count $specs) -eq 0
  set specs $repo/pkg/{fish-spec,omf}/spec/*_spec.fish
end

# `fish -c` only receives positional arguments as $argv since fish 3.1, so
# hand the file list over through a file instead.
printf '%s\n' $specs > "$sandbox/specs"
set -lx OMF_TEST_SPECS_FILE "$sandbox/specs"
if not fish -c 'fish-spec (cat $OMF_TEST_SPECS_FILE)'
  set return_code 1
end

emit omf_tests_done
exit $return_code
