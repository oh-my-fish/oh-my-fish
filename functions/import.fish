# NAME
#      import - load libraries, plugins, themes, etc.
#
# SYNOPSIS
#      import <path/library>[<path/library>..]
#
# DESCRIPTION
#      Import libraries, plugins, themes, completions. Prepend existing
#      user custom/<library> directories to the path to allow users to
#      override specific functions in themes/plugins.
#
# NOTES
#      $fish_path and $fish_custom point to oh-my-fish home and the user
#      dotfiles folder respectively. Both globals are usually configured
#      in ~/.config/fish/config.fish. Also, import is clever enough to
#      skip directories with *.spec.fish files.
#
# EXAMPLES
#      import plugins/<plugin>
#      import plugins/{dpaste,cask} themes/bobthefish
#
# AUTHORS
#      Jorge Bucaran <jbucaran@me.com>
#
# SEE ALSO
#      functions/_prepend_path.fish
#      functions/_prepend_tree.fish
#
# v.0.1.1
#/
function import -d "Load libraries, plugins, themes, etc."
  # Do not add spec files to function path.
  set -l skip_spec \*.fish -a ! \*.spec.fish

  for library in $argv
    # Prepend plugins, themes and completions, traversing library
    # trees and prepending directories with fish code.
    _prepend_tree $fish_path/$library     $skip_spec
    _prepend_tree $fish_custom/$library   $skip_spec
    _prepend_path $fish_path/$library/completions -d fish_complete_path
    _prepend_path $fish_custom/$library/completions -d fish_complete_path

    # Set path to load files.
    set -l path $library/(basename $library).load

    # Source each plugin, theme, etc., configuration load file.
    for load in $fish_path/$path $fish_custom/$path
      if [ -e $load ]
        . $load
      end
    end
  end
end
