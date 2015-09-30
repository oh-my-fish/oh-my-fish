# SYNOPSIS
#   autoload <path>...
#
# OVERVIEW
#   Autoload a function or completion path. Add the specified list of
#   directories to $fish_function_path. Any `completions` directories
#   are correctly added to the $fish_complete_path.
#
#   Returns 0 if one of the paths exist.
#   Returns 1 if all paths are missing.

function autoload -d "autoload a function or completion path"
  set -l path_exist "false"

  for path in $argv
    set -l dest fish_function_path

    if test -d "$path"
      set path_exist "true"

      if test (basename "$path") = completions
        set dest fish_complete_path
      end

      contains "$path" $$dest; or set $dest "$path" $$dest
    end
  end

  test $path_exist = "true"; and return 0; or return 1
end
