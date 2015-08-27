function omf.update
  set -l repo "upstream"
  test -z (git config --get remote.upstream.url)
    and set -l repo "origin"

  if git diff-index --quiet HEAD -- >/dev/null ^&1
    git pull $repo master >/dev/null ^&1
  else
    git stash >/dev/null ^&1
    if git pull --rebase $repo master >/dev/null ^&1
      git stash apply >/dev/null ^&1
    else
      omf.util_sync "origin"
    end
  end
end
