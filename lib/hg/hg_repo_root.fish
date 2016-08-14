function hg_repo_root -d "Return the root of the hg repository"
  set -l dir $PWD
  while test $dir != '/'
    if test -d $dir'/.hg'
      echo -n $dir'/.hg'
    end
    set -l dir (dirname $dir)
  end
end
