function git_is_dirty -d "Check if there are changes to tracked files"
  git_is_worktree; and not command git diff --no-ext-diff --quiet --exit-code
end
