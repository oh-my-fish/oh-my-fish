function omf.util_sync -a remote
  set -l repo $remote
  set -q argv[1]; and set repo $argv[1]

  git fetch origin master
  git reset --hard FETCH_HEAD
  git clean -df
end
