function git_ahead -a ahead behind diverged none
  git_is_repo; and begin
    test -z "$ahead"; and set ahead "+"
    test -z "$behind"; and set behind "-"
    test -z "$diverged"; and set diverged "±"
    test -z "$none"; and set none ""
    command git rev-list --left-right "@{upstream}...HEAD" ^/dev/null \
    | awk "/>/ {a += 1} /</ {b += 1} \
      {if (a > 0) nextfile} END \
      {if (a > 0 && b > 0) print \"$diverged\"; \
      else if (a > 0) print \"$ahead\"; \
      else if (b > 0) print \"$behind\";
      else printf \"$none\"}"
  end
end
