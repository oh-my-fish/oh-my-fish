function redefine_function -d "Redefine a function and backup the old using the prefix 'old_'"
  if not set -q argv[1]; _print_error 'Missing function name argument.'; return 1; end
  if not set -q argv[2]; _print_error 'Missing original function file argument.'; return 1; end
  if not set -q argv[3]; _print_error 'Missing function code argument.'; return 1; end

  _backup_old_function $argv
  _load_new_function $argv
end

function _backup_old_function
  set -l funcname $argv[1]
  set -l funcfile $argv[2]

  if test -f $funcfile
    . $funcfile
    functions -c $funcname old_$funcname
  else
    _print_error "File '$funcfile' not found"
    return 1
  end
end

function _load_new_function
  set -l func $argv[3]

  set -q TMPDIR; or set -l TMPDIR /tmp
  set -l tmpname (printf "$TMPDIR/fish_funced_%d_%d.fish" %self (random))
  while test -f $tmpname
    set tmpname (printf "$TMPDIR/fish_funced_%d_%d.fish" %self (random))
  end

  echo $func > $tmpname
  . $tmpname
  rm $tmpname >/dev/null
end

function _print_error
  set_color red
  echo $argv
  set_color normal
end
