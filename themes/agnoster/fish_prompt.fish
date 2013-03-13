# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for FISH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).

## Set this options in your config.fish (if you want to :])
# set -g THEME_DISPLAY_USER yes
# set -g $DEFAULT_USER your_normal_user



set -g CURRENT_BG NONE
set SEGMENT_SEPARATOR \u2b80
set RIGHT_SEGMENT_SEPARATOR \u2b80
# ===========================
# Helper methods
# ===========================

set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_dirtystate '±'
set -g __fish_git_prompt_char_cleanstate ''

function parse_git_dirty
  set -l submodule_syntax
  set submodule_syntax "--ignore-submodules=dirty"
  set git_dirty (git status -s $submodule_syntax  2> /dev/null)
  if [ -n "$git_dirty" ]
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      echo -n "$__fish_git_prompt_char_dirtystate"
    end
  else
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      echo -n "$__fish_git_prompt_char_cleanstate"
    end
  end
end


# ===========================
# Segments functions
# ===========================

function prompt_segment -d "Function to draw a segment"
  set -l bg
  set -l fg
  if [ -n "$argv[1]" ]
    set bg $argv[1]
  else
    set bg normal
  end
  if [ -n "$argv[2]" ]
    set fg $argv[2]
  else
    set fg normal
  end
  if [ "$CURRENT_BG" != 'NONE' -a "$argv[1]" != "$CURRENT_BG" ]
    set_color -b $bg
    set_color $CURRENT_BG
    echo -n "$SEGMENT_SEPARATOR "
    set_color -b $bg
    set_color $fg
  else
    set_color -b $bg
    set_color $fg
    echo -n " "
  end
  set CURRENT_BG $argv[1]
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3] " "
  end
end

function prompt_finish -d "Close open segments"
  if [ -n $CURRENT_BG ]
    set_color -b normal
    set_color $CURRENT_BG
    echo -n "$SEGMENT_SEPARATOR "
  end
  set -g CURRENT_BG NONE
end


# ===========================
# Theme components
# ===========================

function prompt_user -d "Display actual user if different from $DEFAULT_USER"
  if [ "$THEME_DISPLAY_USER" = "yes" ]
    if [ "$USER" != "$DEFAULT_USER" -o -n "$SSH_CLIENT" ]
      set USER_PROMPT (whoami)@(hostname)
      prompt_segment black yellow $USER_PROMPT
    end
  end
end

function prompt_dir -d "Display the actual directory"
  prompt_segment blue black (prompt_pwd)
end



function prompt_git -d "Display the actual git state"
  set -l ref
  set -l dirty
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set dirty (parse_git_dirty)
    set ref (git symbolic-ref HEAD 2> /dev/null)
    set ref (git symbolic-ref HEAD 2> /dev/null)
    if [ $status -gt 0 ]
      set -l branch (git show-ref --head -s --abbrev |head -n1 2> /dev/null)
      set ref "➦ $branch "
    end
    set -l branch (echo $ref | sed  's-refs/heads/-⭠ -')
    if [ "$dirty" != "" ]
      prompt_segment yellow black "$branch $dirty"
    else
      prompt_segment green black "$branch $dirty"
    end
  end
end

function prompt_status -d "the symbols for a non zero exit status, root and background jobs"
    if [ $RETVAL -ne 0 ]
      prompt_segment black red "✘"
    end

    # if superuser (uid == 0)
    set -l uid (id -u $USER)
    if [ $uid -eq 0 ]
      prompt_segment black yellow "⚡"
    end

    # Jobs display
    if [ (jobs -l | wc -l) -gt 0 ]
      prompt_segment black cyan "⚙"
    end
end

# ===========================
# Apply theme
# ===========================

function fish_prompt
  set -g RETVAL $status
  prompt_status
  prompt_user
  prompt_dir
  prompt_git
  prompt_finish
end
