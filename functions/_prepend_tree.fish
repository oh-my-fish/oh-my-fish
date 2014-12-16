#
# NAME
#      _prepend_tree - add a dependency tree to a path
#
# SYNOPSIS
#      _prepend_tree [-P --preview] <source path> [<glob>..]
#                    [-d --destination <destination path>]
#
# DESCRIPTION
#      Traverse the source path and prepend each directory matching the
#      glob list to the destination path or to the FISH function path.
#      If no globs are specified, match any directories with `.fish`
#      files. Return 1 if the source path is not specified.
#
# OPTIONS
#      -P --preview
#          Use to skip adding anything to the path and echo all matched
#          directories to stdout. Useful for debugging/testing.
#
#      <SOURCE PATH>
#          Required. Specify the path to find glob matches to prepend
#          to the destination path.
#
#      <glob>...
#          Glob pattern to match when traversing the source path. If a
#          directory is found, it is prepended to the destination path.
#          `.fish` is assumed by default if not globs are specified.
#
#          It is also possible to use logical OR / AND operators to list
#          multiple globs. If none is used, OR is assumed by default.
#          The OR operator
#
#          The following operators are available:
#
#             ! -not
#                 Negates the following exression.
#
#                     ! glob1 glob2   →  NOT glob1 or glob2
#
#             -o -or
#                 Any matches should meet at least one listed criteria.
#
#                     glob1 -o glob2  →  glob1 OR glob2
#
#             -a -and
#                 Any matches must meet all listed criteria.
#
#                     glob1 -a glob2  →  glob1 AND glob2
#
#      -d <DESTINATION PATH>
#          Should appear at the end if used. Specifies the name of the
#          global path variable to prepend the matched directories to.
#          If not used, the $fish_function_path is assumed by default.
#
# EXAMPLES
#      _prepend_tree $lib_path
#          Prepends all directories inside $lib_path containing `.fish`
#          files to $fish_function_path.
#
#      _prepend_tree $lib_path -d PATH
#          Prepends all directories inside $lib_path containing .fish
#          files to a global variable named PATH.
#
#      _prepend_tree $lib_path \*.fish \*.sh
#          Prepends sub directories with either `.fish` OR `.sh` files.
#
#      _prepend_tree $lib_path \*.css -a ! _\*.\* -d PATH
#          Prepends sub directories that have `.css` extension, but do
#          not start with `_`.
#
# AUTHORS
#      Jorge Bucaran <jbucaran@me.com>
#
# SEE ALSO
#      .oh-my-fish/functions/_prepend_path.fish
#
# v.0.1.0
#/
function _prepend_tree -d "Load a dependency tree, matching `.fish` files by default."
  set -l source
  set -l destination fish_function_path
  set -l glob
  set -l depth 1
  set -l len (count $argv)
  set -l preview false

  if [ $len -gt 0 ]
    switch $argv[1]
      case -P --preview
        set preview true
        set -e argv[1]
        set len (count $argv)
    end
  end

  [ $len -gt 0 ]
    and set source $argv[1]
    or return 1

  if [ $len -gt 2 ]
  # At least 3 arguments must exist
  # to use the destination path.
    switch $argv[-2]
      case -d --destination
        set destination $argv[-1]
    end
  end

  if [ $len -gt 1 ]
    set -l operator
    for match in $argv[2..-1]
      switch $match
        case ! -not
          set operator $operator !
        case -o -or
          set operator -o
        case -a -and
          set operator -a
        case -d --destination
          break # No more globs after this point.
        case "*"
          [ operator = ! ]
            and set glob $operator $glob
            or set glob $glob $operator
          set glob $glob -name $match
          set operator -o
      end
    end
  end

  [ -z "$glob" ]
    and set glob -name \*.fish

  for directory in $source/**/
    if not [ -z (find $directory $glob -maxdepth $depth | head -1) ]
      eval $preview # skip when on preview mode
        and printf "%s " $directory
        or _prepend_path $directory $destination
    end
  end
end
