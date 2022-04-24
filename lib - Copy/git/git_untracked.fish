function git_untracked -d "Print list of untracked files"
  git_is_worktree; and begin
    command git ls-files --other --exclude-standard
  end
end
