# NAME
#   theme - quick theme switcher
#
# DESCRIPTION
#   Quick theme switcher for Oh my fish. theme is smart to auto-complete
#   as you type from the list available _oh-my-fish_ themes.
#
# SYNOPSIS
#   theme <theme name>
#         [-l --list]
#         [-u --update]
#         [-r --restore]
#         [-h --help]
#
# OPTIONS
#   theme <theme name>
#     Quick switch to theme.
#
#   theme -l --list
#     List available themes.
#
#   theme -u --update
#     Update theme auto-completions.
#
#   theme -r --restore
#     Restore original theme.
#
#   theme -h --help
#     Show usage help.
#
# AUTHORS
#   Jorge Bucaran <jbucaran@me.com>
# /

if not set -q __fish_theme_last
  set -g __fish_theme_last $fish_theme
end

function theme -d "quick theme switcher"
  set -l usage "
    USAGE
      $_ <theme name>
        Quick switch to theme.

      $_ -l --list
        List available themes.

      $_ -r --restore
        Restore original theme.

      $_ -h --help
        Show usage help.
  "
  if test (count $argv) -gt 0
    set -l option $argv[1]
    switch $option
      case -h --help help
        echo $usage

      case -l --list
        set -l regex "[[:<:]]($fish_theme)[[:>:]]"
        if test (uname) != "Darwin"
          set regex "\b($fish_theme)\b"
        end
        set -l color green
        basename -a (theme.util.get.themes) \
          | column \
          | sed -E "s/$regex/"(set_color $color)"\1*"(set_color normal)"/"
        set_color normal

      case -r --restore
        if set -q __fish_theme_last
          if test $__fish_theme_last != $fish_theme
            theme.util.remove.current

            set fish_theme $__fish_theme_last
            . $fish_path/oh-my-fish.fish
          end
        end

      case \*
        if test -z "$option"
          echo $usage

        else if test -d $fish_custom/themes/$option -o \
                     -d $fish_path/themes/$option

          theme.util.remove.current

          set fish_theme $option
          . $fish_path/oh-my-fish.fish

        else
          echo (set_color f00)"`$option` is not a theme."(set_color normal) ^&2
          theme --list
          return 1
        end
    end
  else
    theme --list
  end
end
