function omf.version
  set -l omf_version (command git -C "$OMF_PATH" describe --tags --match 'v*' 2> /dev/null)
  if test -n "$omf_version"
    string replace -r '^v' '' -- $omf_version
    return 0
  end

  # No release tag reachable: fall back to the commit, or "unknown" for a
  # tarball install without a Git checkout.
  set -l commit (command git -C "$OMF_PATH" rev-parse --short HEAD 2> /dev/null)
  if test -n "$commit"
    echo $commit
  else
    echo unknown
  end
  return 0
end
