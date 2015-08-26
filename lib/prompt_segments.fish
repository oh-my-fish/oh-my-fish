# SYNOPSIS
#   set -l segs (prompt_segments) # root dir base
#
# OVERVIEW
#   Extract the root (top-most parent directory), dirname and basename
#   from fish_prompt

function prompt_segments -d "extract root, dir and base from fish_prompt"
  set -l root (prompt_pwd | cut -d "/" -f1)
  if test -z "$root"
    echo "/"
  else
    echo "$root"
  end
  set -l path (prompt_pwd | cut -d "/" -f2-)
  set -l dir (dirname $path)
  if test $dir != "."
    echo $dir
  end
  set -l base (basename $path)
  if test -n "$base" -a "$base" != "~"
    echo $base
  end
end
