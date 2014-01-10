# clean current directory recursively from any .pyc and .pyo files
function pyclean
  set -l path2CLEAN

  if set -q $argv
    set path2CLEAN .
  else
    set path2CLEAN $argv
  end

  find $path2CLEAN -name "*.py[co]" -type f -delete
end
