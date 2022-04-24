function git_is_worktree -d "Check if directory is inside the worktree of a repository"
  git_is_repo
  and test (command git rev-parse --is-inside-git-dir) = false
end
