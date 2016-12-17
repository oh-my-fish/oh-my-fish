function autoload
  switch "$argv[1]"
  case '-e' '--erase'
    test (count $argv) -ge 2
      and __autoload_erase $argv[2..-1]
      or echo "usage: autoload $argv[1] <path>..." >&2
  case "-*" "--*"
    echo "autoload: invalid option $argv[1]"
    return 1
  case '*'
    test (count $argv) -ge 1
      and __autoload_insert $argv
      or echo "usage: autoload <path>..." >&2
  end
end
function __autoload_insert
  set -l function_path
  set -l complete_path
  for path in $argv
    not test -d "$path"; and continue
    set -l IFS '/'
    echo $path | read -la components
    if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    end;
  end;
  test -n "$function_path"
    and set fish_function_path $fish_function_path[1] $function_path $fish_function_path[2..-1]
  test -n "$complete_path"
    and set fish_complete_path $fish_complete_path[1] $complete_path $fish_complete_path[2..-1]
  return 0
end;
function __autoload_erase
  set -l function_indexes
  set -l complete_indexes
  for path in $argv
    set -l IFS '/'
    echo $path | read -la components
    test "x$components[-1]" = xcompletions
      and set complete_indexes $complete_indexes (contains -i $path $fish_complete_path)
      or  set function_indexes $function_indexes (contains -i $path $fish_function_path)
  end;
  test -n "$function_indexes"
    and set -e fish_function_path[$function_indexes]
  test -n "$complete_indexes"
    and set -e fish_complete_path[$complete_indexes]
  return 0
end;
