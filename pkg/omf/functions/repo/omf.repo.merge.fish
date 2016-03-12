function omf.repo.merge
  if test (count $argv) -eq 0
    echo (omf::err)"omf.repo.merge takes a repository path as an argument."(omf::off) 1>&2
    return $OMF_MISSING_ARG
  end
  set -l repo_dir $argv[1]

  function __omf.repo.git -V repo_dir
    command git -C "$repo_dir" $argv
  end

  set initial_branch (__omf.repo.git symbolic-ref -q --short HEAD);
    or return 1
  set initial_revision (__omf.repo.git rev-parse -q --verify HEAD);
    or return 1

  if not test (__omf.repo.git rev-parse --verify --quiet FETCH_HEAD)
    echo "FETCH_HEAD not found. Did you fetch before trying to merge?"
    return 1
  end

  if test (__omf.repo.git rev-list --count master...FETCH_HEAD) -eq 0
    return 2
  end

  if not __omf.repo.git diff --quiet
    echo (omf::em)"Stashing your changes:"(omf::off)
    __omf.repo.git status --short --untracked-files
    __omf.repo.git stash save --include-untracked --quiet;
      and set stashed
  end

  if test "$initial_branch" != master
    __omf.repo.git checkout master --quiet
  end

  if not __omf.repo.git merge --ff-only --quiet FETCH_HEAD
    __omf.repo.git checkout $initial_branch
    __omf.repo.git reset --hard $initial_revision
    set -q stashed; and __omf.repo.git stash pop
    return 1
  end

  if test "$initial_branch" != master
    __omf.repo.git checkout $initial_branch --quiet
  end

  if set -q stashed
    __omf.repo.git stash pop --quiet

    echo (omf::em)"Restored your changes:"(omf::off)
    __omf.repo.git status --short --untracked-files
  end

  return 0
end
