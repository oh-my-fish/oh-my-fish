function git_untracked -d "Print list of untracked files"
  git_is_repo; and begin
    command git ls-files --other --exclude-standard
  end
end
