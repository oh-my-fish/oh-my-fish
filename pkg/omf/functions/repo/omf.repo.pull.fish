function omf.repo.pull -a repo_dir branch
  if test -z "$branch"
    set branch "master"
  end

  function __omf.repo.git -V repo_dir
    command git -C "$repo_dir" $argv
  end

  set -l remote origin
  if test (__omf.repo.git config --get remote.upstream.url)
    set remote upstream
  end

  set initial_branch (__omf.repo.git symbolic-ref -q --short HEAD);
    or return 1
  set initial_revision (__omf.repo.git rev-parse -q --verify HEAD);
    or return 1

  # the refspec ensures that '$remote/$branch' gets updated
  set -l refspec "refs/heads/$branch:refs/remotes/$remote/$branch"
  __omf.repo.git fetch --quiet $remote $refspec;
    or return 1

  if test (__omf.repo.git rev-list --count "$branch"...FETCH_HEAD) -eq 0
    return 2
  end

  if not __omf.repo.git diff --quiet
    echo (omf::em)"Stashing your changes:"(omf::off)
    __omf.repo.git status --short --untracked-files
    __omf.repo.git stash save --include-untracked --quiet;
      and set stashed
  end

  if test "$initial_branch" != "$branch"
    __omf.repo.git checkout "$branch" --quiet
  end

  if not __omf.repo.git merge --ff-only --quiet FETCH_HEAD
    __omf.repo.git checkout $initial_branch
    __omf.repo.git reset --hard $initial_revision
    set -q stashed; and __omf.repo.git stash pop
    return 1
  end

  if test "$initial_branch" != "$branch"
    __omf.repo.git checkout $initial_branch --quiet
  end

  if set -q stashed
    __omf.repo.git stash pop --quiet

    echo (omf::em)"Restored your changes:"(omf::off)
    __omf.repo.git status --short --untracked-files
  end

  return 0
end
