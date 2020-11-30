function git_is_touched -d "Check if repo has any changes"
  git_is_worktree; and begin
    # The first checks for staged changes, the second for unstaged ones.
    # We put them in this order because checking staged changes is *fast*.  
    not command git diff-index --cached --quiet HEAD -- >/dev/null 2>&1
    or not command git diff --no-ext-diff --quiet --exit-code >/dev/null 2>&1
  end
end
