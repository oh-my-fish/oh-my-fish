# omf.check.version <min_version> <current_version>
# Succeeds when current_version is at least min_version.
function omf.check.version -a min_version current_version
  set -l lowest (printf '%s\n' "$min_version" "$current_version" \
    | command sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n \
    | command head -n 1)
  test "$lowest" = "$min_version"
end
