function git_is_repo -d "Check if directory is a repository"
  set -l is_bare (command git rev-parse --is-bare-repository 2>/dev/null)
  test "$is_bare" = false
end
