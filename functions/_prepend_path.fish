# NAME
#      _prepend_path - adds a path to a list
#
# SYNOPSIS
#      _prepend_path [-d --destination <destination path>] <path>
#
# DESCRIPTION
#      Adds a path to a list.
#      If no list specified, defaults to $PATH
#
# OPTIONS
#      <path>
#          Required. Specify the path to add to the list.

# OPERATORS
#      -d <DESTINATION PATH>
#          Should appear at the end if used. Specifies the name of the
#          list to prepend the paths to.
#          If not used, $PATH is assumed by default.
#
# EXAMPLES
#      _prepend_path $path
#          Add $path to $PATH
#
#      _prepend_path $path -d $fish_function_path
#          Add $path to $fish_function_path
#/
function _prepend_path
  # $PATH is the default destination path
  set -l destination_path PATH 
  set -l path $argv

  if test (count $argv) -gt 2
    switch $path[-2]
    case -d --destination
      set destination_path $path[-1]
      set path $path[1..-3]
    end
  end

  for path in $path
    if test -d $path
      if not contains $path $$destination_path
        set $destination_path $path $$destination_path
      end
    end
  end
end
