function omf.repo.pull
  if test (command git config --get remote.upstream.url)
    set repository upstream
  else
    set repository origin
  end

  set initial_branch (command git symbolic-ref -q --short HEAD); or return $OMF_UNKNOWN_ERR
  set initial_revision (command git rev-parse -q --verify HEAD); or return $OMF_UNKNOWN_ERR

  if not command git diff --quiet
    echo (omf::em)"Stashing your changes:"(omf::off)
    command git status --short --untracked-files

    command git stash save --include-untracked --quiet
    set stashed true
  end

  if test "$initial_branch" != master
    command git checkout master --quiet
  end

  # the refspec ensures that '$repository/master' gets updated
  command git pull --rebase --quiet $repository "refs/heads/master:refs/remotes/$repository/master"
  if test $status -eq 2 #SIGINT
    command git checkout $initial_branch
    command git reset --hard $initial_revision
    test "$stashed" = true; and command git stash pop
  end

  if test "$initial_branch" != master
    command git checkout $initial_branch --quiet
  end

  if test "$stashed" = true
    command git stash pop --quiet

    echo (omf::em)"Restored your changes:"(omf::off)
    command git status --short --untracked-files
  end

  return 0
end
