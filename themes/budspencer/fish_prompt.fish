###############################################################################
#
# prompt theme name: budspencer
#
# description: a sophisticated airline/powerline theme
#
# author: Joseph Tannhuber
#
###############################################################################

###############################################################################
# Color definitions
###############################################################################

# define colors
# values are: black dark_gray light_gray white yellow orange red magenta violet blue cyan green
set -g budspencer_colors 000000 083743 445659 fdf6e3 b58900 cb4b16 dc121f af005f 6c71c4 268bd2 2aa198 859900

# cursor color changes according to vi-mode
# define values for: normal_mode insert_mode visual_mode
set -g budspencer_cursors "\033]12;#$budspencer_colors[10]\007" "\033]12;#$budspencer_colors[5]\007" "\033]12;#$budspencer_colors[8]\007"

# some terminals cannot change the cursor color
set -l unsupported_terminals "fbterm" "st" "linux" "screen"
if contains $TERM $unsupported_terminals
   set -e budspencer_cursors
end

###############################################################################
# Utils
###############################################################################

function __budspencer_git_branch_name -d "Return the current branch name"
  set -l branch (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  if test (count $branch) -eq 0
    set -l position (git describe --contains --all HEAD ^/dev/null)
      if test (count $position) -eq 0
        set -l commit (git rev-parse HEAD ^/dev/null | sed  's|\(^.......\).*|\1|')
        echo -n (set_color -b $budspencer_colors[11])""(set_color $budspencer_colors[1])" ➦ "$commit" "(set_color $budspencer_colors[11])
      else
        echo -n (set_color -b $budspencer_colors[9])""(set_color $budspencer_colors[1])"  "$position" "(set_color $budspencer_colors[9])
      end
  else
    echo -n (set_color -b $budspencer_colors[3])""(set_color $budspencer_colors[1])"  "$branch" "(set_color $budspencer_colors[3])
  end
end

function fish_vi_prompt_cm -d "Displays the current mode"
  switch $fish_bind_mode
    case default
      set_color -b $budspencer_colors[10] $budspencer_colors[1]
      echo -en $budspencer_cursors[1]
      if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings"
        echo -n " NORMAL "
      else
        echo -n " EMACS "
      end
      set_color -b $budspencer_colors[1] $budspencer_colors[10]
    case insert
      set_color -b $budspencer_colors[5] $budspencer_colors[1]
      echo -en $budspencer_cursors[2]
      echo -n " INSERT "
      set_color -b $budspencer_colors[1] $budspencer_colors[5]
    case visual
      set_color -b $budspencer_colors[8] $budspencer_colors[1]
      echo -en $budspencer_cursors[3]
      echo -n " VISUAL "
      set_color -b $budspencer_colors[1] $budspencer_colors[8]
  end
end

function fish_prompt_symbols -d "Display symbols"
  set_color -b $budspencer_colors[2]
  echo -n ""
  # indicator for vim parent process
  if set -q -x VIM
    set_color -o $budspencer_colors[9]
    echo -n " V"
  end
  # indicator for ranger parent process
  if set -q -x RANGER_LEVEL
    set_color -o $budspencer_colors[9]
    echo -n " R"
  end
  # background job indicator
  if [ (jobs | wc -l)  -gt 0 ]
    set_color -o $budspencer_colors[11]
    echo -n " ⚙"
  end
  # write protection indicator
  if [ ! -w . ]
    set_color -o $budspencer_colors[6]
    echo -n " "
  end
  # status indicator
  if [ $last_status -eq 0 ]
    set_color -o $budspencer_colors[12]
    echo -n " ✔"
  else
    set_color -o $budspencer_colors[7]
    echo -n " ✘"
  end
  # superuser indicator
  if [ $USER = "root" ]
    set_color -o $budspencer_colors[6]
    echo -n " ⚡"
  end
  echo -n " "
  set_color -b normal $budspencer_colors[2]
end

###############################################################################
# Prompt
###############################################################################

function fish_prompt -d "Write out the left prompt of the budspencer theme"
  set -g last_status $status

  #############################################################################
  # Segments
  #############################################################################

  # vi mode
  set -l ps_vi ""
  set ps_vi (fish_vi_prompt_cm)

  # git
  set -l ps_git ""
  set -l git_branch_name (__budspencer_git_branch_name)
  if test -n "$git_branch_name"
    set ps_git $git_branch_name
  end

  # symbols
  set -l ps_symbols (fish_prompt_symbols)

  # left prompt
  echo -n -s $ps_vi $ps_git $ps_symbols '' ' '
end
