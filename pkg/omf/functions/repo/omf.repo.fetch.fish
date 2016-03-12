function omf.repo.fetch
  if test (count $argv) -eq 0
    echo (omf::err)"omf.repo.fetch takes a repository path as an argument."(omf::off)
    return $OMF_MISSING_ARG
  end

  set -l repo_dir $argv[1]
  function __omf.repo.git -V repo_dir
    command git -C "$repo_dir" $argv
  end

  set -l remote origin
  if test (__omf.repo.git config --get remote.upstream.url)
    set remote upstream
  end

  # the refspec ensures that '$remote/master' gets updated
  set -l refspec "refs/heads/master:refs/remotes/$remote/master"
  __omf.repo.git fetch --quiet $remote $refspec;
    or return 1

  return 0
end
