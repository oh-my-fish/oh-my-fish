function git_is_worktree -d "Check if directory is inside the worktree of a repository"
  set -l is_worktree (command git rev-parse --is-inside-work-tree 2>/dev/null)
  test "$is_worktree" = true
end
