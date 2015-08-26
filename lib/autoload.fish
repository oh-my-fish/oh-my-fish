# SYNOPSIS
#   autoload <path [path...]>
#
# OVERVIEW
#   Autoload a function or completion path. Add the specified list of
#   directories to $fish_function_path. Any `completions` directories
#   are correctly added to the $fish_complete_path.

function autoload -d "autoload a function or completion path"
  for path in $argv
    if test -d "$path"
      set -l dest fish_function_path
      if test (basename "$path") = "completions"
        set dest fish_complete_path
      end
      contains "$path" $$dest; or set $dest "$path" $$dest
    end
  end
end
