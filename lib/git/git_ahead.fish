function git_ahead -a ahead behind diverged none
  not git_is_repo; and return

  set -l commit_count (command git rev-list --count --left-right "@{upstream}...HEAD" ^/dev/null)

  switch "$commit_count"
  case ""
    # no upstream
  case "0"\t"0"
    test -z "$ahead"; and echo "$ahead"
      or echo ""
  case "*"\t"0"
    test -z "$behind"; and echo "$behind"
      or echo "-"
  case "0"\t"*"
    test -z "$ahead"; and echo "$ahead"
      or echo "+"
  case "*"
    test -z "$diverged"; and echo "$diverged"
      or echo "±"
  end
end
