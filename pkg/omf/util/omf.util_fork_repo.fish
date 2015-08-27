function omf.util_fork_repo -a user repo
  curl -u "$user" --fail --silent https://api.github.com/repos/$repo/forks \
   -d "{\"user\":\"$user\"}" >/dev/null ^&1
end
