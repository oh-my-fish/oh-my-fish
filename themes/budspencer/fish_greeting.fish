###############################################################################
#
# prompt theme name:
#   budspencer
#
# description:
#   a sophisticated airline/powerline theme
#
# author:
#   joseph tannhuber <sepp.tannhuber@yahoo.de>
#
# sections:
#   -> Color definitions
#   -> Functions
#     -> Help
#     -> Environment
#     -> Window title
#     -> Welcome message
#
###############################################################################

###############################################################################
# => Color definitions
###############################################################################

# Define colors
set -U budspencer_night 000000 083743 445659 fdf6e3 b58900 cb4b16 dc121f af005f 6c71c4 268bd2 2aa198 859900
set -U budspencer_day 000000 333333 666666 ffffff ffff00 ff6600 ff0000 ff0033 3300ff 00aaff 00ffff 00ff00
if not set -q budspencer_colors
  # Values are: black dark_gray light_gray white yellow orange red magenta violet blue cyan green
  set -U budspencer_colors $budspencer_night
end

# Cursor color changes according to vi-mode
# Define values for: normal_mode insert_mode visual_mode
set -U budspencer_cursors "\033]12;#$budspencer_colors[10]\007" "\033]12;#$budspencer_colors[5]\007" "\033]12;#$budspencer_colors[8]\007" "\033]12;#$budspencer_colors[9]\007"

# Some terminals cannot change the cursor color
set -l unsupported_terminals 'fbterm' 'st' 'linux' 'screen'
if contains $TERM $unsupported_terminals
  set budspencer_cursors '' '' '' ''
end

###############################################################################
# => Functions
###############################################################################

#########
# => Help
#########
function budspencer_help -d 'Show helpfile'
  set -l readme_file "$fish_path/themes/budspencer/README.md"
  if set -q PAGER
    if [ -e $readme_file ]
      eval $PAGER $readme_file
      else
        set_color $fish_color_error[1]
        echo "$readme_file wasn't found."
      end
  else
    open $readme_file
  end
end

################
# => Environment
################
function day -d "Set color palette for bright environment."
  set budspencer_colors $budspencer_day
  set budspencer_cursors "\033]12;#$budspencer_colors[10]\007" "\033]12;#$budspencer_colors[5]\007" "\033]12;#$budspencer_colors[8]\007" "\033]12;#$budspencer_colors[9]\007"
end

function night -d "Set color palette for dark environment."
  set budspencer_colors $budspencer_night
  set budspencer_cursors "\033]12;#$budspencer_colors[10]\007" "\033]12;#$budspencer_colors[5]\007" "\033]12;#$budspencer_colors[8]\007" "\033]12;#$budspencer_colors[9]\007"
end

#################
# => Window title
#################
function wt -d 'Set window title'
  set -g window_title $argv
  function fish_title
    echo -n $window_title
  end
end

####################
# => Welcome message
####################
function fish_greeting -d 'Show greeting in login shell.'
  if not set -q budspencer_nogreeting
    if begin
      not set -q -x LOGIN
      and not set -q -x RANGER_LEVEL
      and not set -q -x VIM
      end
      echo This is (set_color -b $budspencer_colors[2] $budspencer_colors[10])budspencer(set_color normal) theme for fish, a theme for the 70s.
      echo Type (set_color -b $budspencer_colors[2] $budspencer_colors[6])»budspencer_help«(set_color normal) in order to see how you can speed up your workflow.
      end
  end
end
