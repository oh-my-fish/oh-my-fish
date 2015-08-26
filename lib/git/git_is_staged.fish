function git_is_staged -d "Check if repo has staged changes"
  git_is_repo; and begin
    not command git diff --cached --no-ext-diff --quiet --exit-code
  end
end
