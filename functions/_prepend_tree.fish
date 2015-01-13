# NAME
#      _prepend_tree - add a dependency tree to fish_function_path
#
# SYNOPSIS
#      _prepend_tree [-v --verbose] <path> [<glob>..]
#
# DESCRIPTION
#      Search a path tree and prepend directories with fish files. Use a glob
#      list to include or exclude other file extensions. Use -v --verbose to
#      output directories to be added to the path.
#
# OPTIONS
#      [-v --verbose]
#          Optional. Print directories that match the glob. Must be the
#          first argument if used.
#
#      <path>
#          Required. Specify the path to search for glob patterns.
#
#      [<glob> [<operator> <glob>..]]
#          Glob pattern to match when traversing the path path.
#
# OPERATORS
#      [! -not glob]
#          Negates the following glob.
#
#      [<glob> -o -or <glob>..]
#          Default. Must meet at least one listed criteria.
#
#      [<glob> [-a -and <glob>..]]
#          Must meet *all* listed criteria.
#
# EXAMPLES
#      _prepend_tree $path
#          Match directories in $path containing `.fish` files.
#
#      _prepend_tree $path \*.fish \*.sh
#          Match directories in $path with either `.fish` OR `.sh` files.
#
#      _prepend_tree $path \*.fish -a ! _\*.\*
#          Match directories with `.fish` files that do not start with `_`.
#
# AUTHORS
#      Jorge Bucaran <jbucaran@me.com>
#
# SEE ALSO
#      .oh-my-fish/functions/_prepend_path.fish
#
# v.0.2.0
#/
function _prepend_tree -d "Add a dependency tree to the Fish path."
  # Match directories with .fish files always.
  set -l glob -name \*.fish
  set -l verbose ""

  # Retrieve first argument, either the path or the -v option.
  set -l path $argv[1]
  if contains -- $path -v --verbose
    set verbose -v
    # Option first, path should be next.
    set path $argv[2]
  end

  # Parse glob options to create the main glob pattern.
  if [ (count $argv) -gt 2 ]
    set -l operator -o
    for option in $argv[3..-1]
      switch $option
        case ! -not
          set operator $operator !
        case -o -or
          set operator -o
        case -a -and
          set operator -a
        case "*"
          if [ operator = ! ]
            set glob $operator $glob
          else
            set glob $glob $operator
          end
          set glob $glob -name $option
          set operator -o # Default
      end
    end
  end

  # Null wildcard expansion will break the for loop even if $path is valid.
  # $subs will become an empty list for directories without sub directories
  # which is safe to use in the loop.
  set -l subs $path/**/

  # Traverse $path and $subs prepending only directories with matches.
  for dir in $path $subs
    # Use head to retrieve at least one match. Skip not found errors
    # for directories that do not exist.
    if [ -z (find "$dir" $glob -maxdepth 1 ^/dev/null | head -1) ]
      continue
    end

    # Print matched directories if the -v option is set.
    if not [ -z $verbose ]
      printf "%s\n" $dir
    end

    # Prepend matched directory to the the global fish function path.
    # Note path duplicates are already handled by _prepend_path.
    _prepend_path $dir -d fish_function_path
  end
end
