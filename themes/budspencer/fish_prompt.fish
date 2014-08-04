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
set -g budspencer_colors 000000 083743 445659 fdf6e3 b58900 cb4b16 dc121f af005f 6c71c4 268bd2 2aa198 859900

# cursor colors
set -g budspencer_cursors "\033]12;#$budspencer_colors[10]\007" "\033]12;#$budspencer_colors[5]\007" "\033]12;#$budspencer_colors[8]\007"
set -l unsupported_terminals "fbterm" "st" "linux" "screen"
for term in $unsupported_terminals
  if test $term = $TERM
    set -g budspencer_cursors "" "" ""
  end
end

###############################################################################
# Utils
###############################################################################

set -g __budspencer_display_rprompt 1

function __budspencer_git_branch_name -d "Return the current branch name"
  set -l branch (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  if test (count $branch) -eq 0
    set -l position (git describe --contains --all HEAD ^/dev/null)
      if test (count $position) -eq 0
        set -l commit (git rev-parse HEAD ^/dev/null | sed -r 's|(^.{7}).*|\1|')
        echo -n (set_color -b $budspencer_colors[11])""(set_color $budspencer_colors[1])" ➦ "$commit" "(set_color $budspencer_colors[11])
      else
        echo -n (set_color -b $budspencer_colors[9])""(set_color $budspencer_colors[1])"  "$position" "(set_color $budspencer_colors[9])
      end
  else
    echo -n (set_color -b $budspencer_colors[3])""(set_color $budspencer_colors[1])"  "$branch" "(set_color $budspencer_colors[3])
  end
end

function fish_vi_prompt_cm --description "Displays the current mode"
  switch $fish_bind_mode
    case default
      set_color -b $budspencer_colors[10] $budspencer_colors[1]
      echo -en $budspencer_cursors[1]
      echo -n " NORMAL "
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

function fish_prompt_symbols --description "Display symbols"
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
  set -l basedir_name (basename (prompt_pwd))

  #############################################################################
  # Segments
  #############################################################################

  # vi mode
  set -l ps_vi ""
  if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings"
    set ps_vi (fish_vi_prompt_cm)
  end

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
