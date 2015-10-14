function omf.repo.pull
  if test (count $argv) -eq 0
    echo (omf::err)"Argument of omf.repo.pull is the repo path."(omf::off)
    return $OMF_MISSING_ARG
  end
  set -l repo_dir $argv[1]

  if test (command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" config --get remote.upstream.url)
    set repository upstream
  else
    set repository origin
  end

  set initial_branch (command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" symbolic-ref -q --short HEAD); or return $OMF_UNKNOWN_ERR
  set initial_revision (command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" rev-parse -q --verify HEAD); or return $OMF_UNKNOWN_ERR

  if not command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" diff --quiet
    echo (omf::em)"Stashing your changes:"(omf::off)
    command git -C "$repo_dir" status --short --untracked-files

    command git -C "$repo_dir" stash save --include-untracked --quiet
    set stashed
  end

  if test "$initial_branch" != master
    command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" checkout master --quiet
  end

  # the refspec ensures that '$repository/master' gets updated
  command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" pull --rebase --quiet $repository "refs/heads/master:refs/remotes/$repository/master"
  if test $status -eq 2 #SIGINT
    command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" checkout $initial_branch
    command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" reset --hard $initial_revision
    set -q stashed; and command git -C "$repo_dir" stash pop
  end

  if test "$initial_branch" != master
    command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" checkout $initial_branch --quiet
  end

  if set -q stashed
    command git -C "$repo_dir" stash pop --quiet

    echo (omf::em)"Restored your changes:"(omf::off)
    command git -C "$repo_dir" status --short --untracked-files
  end

  return 0
end
