function omf.repo.pull

  if test (count $argv) -eq 0
    echo (omf::err)"Argument of omf.repo.pull is the repo path."(omf::off)
    return $OMF_MISSING_ARG
  end

  set -l repo_dir $argv[1]

  function omf.repo.git -V repo_dir
    command git --git-dir "$repo_dir"/.git --work-tree "$repo_dir" $argv
  end

  function omf.repo.git.stash -V repo_dir
    command git -C "$repo_dir" stash $argv
  end

  set -l remote origin
  if test (omf.repo.git config --get remote.upstream.url)
    set remote upstream
  end

  set initial_branch (omf.repo.git symbolic-ref -q --short HEAD);
    or return $OMF_UNKNOWN_ERR
  set initial_revision (omf.repo.git rev-parse -q --verify HEAD);
    or return $OMF_UNKNOWN_ERR

  if not omf.repo.git diff --quiet
    echo (omf::em)"Stashing your changes:"(omf::off)
    omf.repo.git status --short --untracked-files
    omf.repo.git.stash save --include-untracked --quiet;
      and set stashed
  end

  if test "$initial_branch" != master
    omf.repo.git checkout master --quiet
  end

  set -l refspec "refs/heads/master:refs/remotes/$remote/master"

  # the refspec ensures that '$remote/master' gets updated
  if not omf.repo.git pull --ff-only --quiet $remote $refspec
    omf.repo.git checkout $initial_branch
    omf.repo.git reset --hard $initial_revision
    set -q stashed; and omf.repo.git.stash pop
  end

  if test "$initial_branch" != master
    omf.repo.git checkout $initial_branch --quiet
  end

  if set -q stashed
    omf.repo.git.stash pop --quiet

    echo (omf::em)"Restored your changes:"(omf::off)
    command git -C "$repo_dir" status --short --untracked-files
  end

  functions -e omf.repo.git{,.stash}
  return 0
end
