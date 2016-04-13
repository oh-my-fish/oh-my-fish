function omf.repo.remote_uri -a repo_dir -a branch
  test -z "$repo_dir"; and set repo_dir "$PWD"
  set -l git_dir (command git -C "$repo_dir" rev-parse --show-toplevel 2>/dev/null)
    and test "$git_dir" = "$repo_dir"
    or return 1

  test -z "$branch"; and set branch 'master'

  set -l remote (command git -C "$repo_dir" config --get branch."$branch".remote)
    or set -l remote origin

  command git -C "$repo_dir" config --get remote."$remote".url
end
