function git_is_stashed -d "Check if repo has stashed contents"
  git_is_repo; and begin
    command git rev-parse --verify --quiet refs/stash >/dev/null
  end
end
