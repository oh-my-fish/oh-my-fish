# SYNOPSIS
#   autoload <path>...
#   autoload -e <path>...
#
# OVERVIEW
#   Manipulate autoloading path components.
#
#   If called without options, the paths passed as arguments are added to
#   $fish_function_path. All paths ending with `completions` are correctly
#   added to $fish_complete_path. Returns 0 if one or more paths exist. If all
#   paths are missing, returns != 0.
#
#   When called with -e, the paths passed as arguments are removed from
#   $fish_function_path. All arguments ending with `completions` are correctly
#   removed from $fish_complete_path. Returns 0 if one or more paths erased. If
#   no paths were erased, returns != 0.

function autoload -d "Manipulate autoloading path components"
  set -l paths $argv

  switch "$argv[1]"
  case '-e' '--erase'
    set erase

    if test (count $argv) -ge 2
      set paths $argv[2..-1]
    else
      echo "usage: autoload $argv[1] <path>..." 1>&2
      return 1
    end
  case "-*" "--*"
    echo "autoload: invalid option $argv[1]"
    return 1
  end

  for path in $paths
    not test -d "$path"; and continue

    set -l dest fish_function_path

    if test (basename "$path") = completions
      set dest fish_complete_path
    end

    if set -q erase
      if set -l index (contains -i -- $path $$dest)
        set -e {$dest}[$index]
        set return_success
      end
    else
      set return_success
      contains -- "$path" $$dest; and continue
      set $dest "$path" $$dest
    end
  end

  set -q return_success
end
