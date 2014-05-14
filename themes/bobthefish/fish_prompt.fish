# name: bobthefish
#
# bobthefish is a Powerline-style, Git-aware fish theme optimized for awesome.
#
# You will probably need a Powerline-patched font for this to work:
#
#     https://powerline.readthedocs.org/en/latest/fontpatching.html
#
# I recommend picking one of these:
#
#     https://github.com/Lokaltog/powerline-fonts
#
# You can override some default options in your config.fish:
#
#     set -g theme_display_user yes
#     set -g default_user your_normal_user

set -g __bobthefish_current_bg NONE

# Powerline glyphs
set __bobthefish_branch_glyph            \uE0A0
set __bobthefish_ln_glyph                \uE0A1
set __bobthefish_padlock_glyph           \uE0A2
set __bobthefish_right_black_arrow_glyph \uE0B0
set __bobthefish_right_arrow_glyph       \uE0B1
set __bobthefish_left_black_arrow_glyph  \uE0B2
set __bobthefish_left_arrow_glyph        \uE0B3

# Additional glyphs
set __bobthefish_detached_glyph          \u27A6
set __bobthefish_nonzero_exit_glyph      '! '
set __bobthefish_superuser_glyph         '$ '
set __bobthefish_bg_job_glyph            '% '

# Colors
set __bobthefish_lt_green   addc10
set __bobthefish_med_green  189303
set __bobthefish_dk_green   0c4801

set __bobthefish_lt_red     C99
set __bobthefish_med_red    ce000f
set __bobthefish_dk_red     600

set __bobthefish_slate_blue 255e87

set __bobthefish_lt_orange  f6b117
set __bobthefish_dk_orange  3a2a03

set __bobthefish_dk_grey    333
set __bobthefish_med_grey   999
set __bobthefish_lt_grey    ccc

# ===========================
# Helper methods
# ===========================

function __bobthefish_in_git -d 'Check whether pwd is inside a git repo'
  command git rev-parse --is-inside-work-tree >/dev/null 2>&1
end

function __bobthefish_git_branch -d 'Get the current git branch (or commitish)'
  set -l ref (command git symbolic-ref HEAD 2> /dev/null)
  if [ $status -gt 0 ]
    set -l branch (command git show-ref --head -s --abbrev |head -n1 2> /dev/null)
    set ref "$__bobthefish_detached_glyph $branch"
  end
  echo $ref | sed  "s-refs/heads/-$__bobthefish_branch_glyph -"
end

function __bobthefish_pretty_parent -d 'Print a parent directory, shortened to fit the prompt'
  echo -n (dirname $argv[1]) | sed -e 's|/private||' -e "s|^$HOME|~|" -e 's-/\(\.\{0,1\}[^/]\)\([^/]*\)-/\1-g' -e 's|/$||'
end

function __bobthefish_project_dir -d 'Print the current git project base directory'
  command git rev-parse --show-toplevel 2>/dev/null
end

function __bobthefish_project_pwd -d 'Print the working directory relative to project root'
  set -l base_dir (__bobthefish_project_dir)
  echo "$PWD" | sed -e "s*$base_dir**g" -e 's*^/**'
end


# ===========================
# Segment functions
# ===========================

function __bobthefish_start_segment -d 'Start a prompt segment'
  set_color -b $argv[1]
  set_color $argv[2]
  if [ "$__bobthefish_current_bg" = 'NONE' ]
    # If there's no background, just start one
    echo -n ' '
  else
    # If there's already a background...
    if [ "$argv[1]" = "$__bobthefish_current_bg" ]
      # and it's the same color, draw a separator
      echo -n "$__bobthefish_right_arrow_glyph "
    else
      # otherwise, draw the end of the previous segment and the start of the next
      set_color $__bobthefish_current_bg
      echo -n "$__bobthefish_right_black_arrow_glyph "
      set_color $argv[2]
    end
  end
  set __bobthefish_current_bg $argv[1]
end

function __bobthefish_path_segment -d 'Display a shortened form of a directory'
  if test -w "$argv[1]"
    __bobthefish_start_segment $__bobthefish_dk_grey $__bobthefish_med_grey
  else
    __bobthefish_start_segment $__bobthefish_dk_red $__bobthefish_lt_red
  end

  set -l directory
  set -l parent

  switch "$argv[1]"
    case /
      set directory '/'
    case "$HOME"
      set directory '~'
    case '*'
      set parent    (__bobthefish_pretty_parent "$argv[1]")
      set parent    "$parent/"
      set directory (basename "$argv[1]")
  end

  test "$parent"; and echo -n -s "$parent"
  set_color fff --bold
  echo -n "$directory "
  set_color normal
end

function __bobthefish_finish_segments -d 'Close open prompt segments'
  if [ -n $__bobthefish_current_bg -a $__bobthefish_current_bg != 'NONE' ]
    set_color -b normal
    set_color $__bobthefish_current_bg
    echo -n "$__bobthefish_right_black_arrow_glyph "
    set_color normal
  end
  set -g __bobthefish_current_bg NONE
end


# ===========================
# Theme components
# ===========================

function __bobthefish_prompt_status -d 'Display symbols for a non zero exit status, root and background jobs'
  set -l nonzero
  set -l superuser
  set -l bg_jobs

  # Last exit was nonzero
  if [ $RETVAL -ne 0 ]
    set nonzero $__bobthefish_nonzero_exit_glyph
  end

  # if superuser (uid == 0)
  set -l uid (id -u $USER)
  if [ $uid -eq 0 ]
    set superuser $__bobthefish_superuser_glyph
  end

  # Jobs display
  if [ (jobs -l | wc -l) -gt 0 ]
    set bg_jobs $__bobthefish_bg_job_glyph
  end

  set -l status_flags "$nonzero$superuser$bg_jobs"

  if test "$nonzero" -o "$superuser" -o "$bg_jobs"
    __bobthefish_start_segment fff 000
    if [ "$nonzero" ]
      set_color $__bobthefish_med_red --bold
      echo -n $__bobthefish_nonzero_exit_glyph
    end

    if [ "$superuser" ]
      set_color $__bobthefish_med_green --bold
      echo -n $__bobthefish_superuser_glyph
    end

    if [ "$bg_jobs" ]
      set_color $__bobthefish_slate_blue --bold
      echo -n $__bobthefish_bg_job_glyph
    end

    set_color normal
  end
end

function __bobthefish_prompt_user -d 'Display actual user if different from $default_user'
  if [ "$theme_display_user" = 'yes' ]
    if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
      __bobthefish_start_segment $__bobthefish_lt_grey $__bobthefish_slate_blue
      echo -n -s (whoami) '@' (hostname | cut -d . -f 1) ' '
    end
  end
end

# TODO: clean up the fugly $ahead business
function __bobthefish_prompt_git -d 'Display the actual git state'
  set -l dirty   (command git diff --no-ext-diff --quiet --exit-code; or echo -n '*')
  set -l staged  (command git diff --cached --no-ext-diff --quiet --exit-code; or echo -n '~')
  set -l stashed (command git rev-parse --verify refs/stash > /dev/null 2>&1; and echo -n '$')
  set -l ahead   (command git branch -v 2> /dev/null | grep -Eo '^\* [^ ]* *[^ ]* *\[[^]]*\]' | grep -Eo '\[[^]]*\]$' | awk 'ORS="";/ahead/ {print "+"} /behind/ {print "-"}' | sed -e 's/+-/±/')

  set -l new (command git ls-files --other --exclude-standard);
  test "$new"; and set new '…'

  set -l flags   "$dirty$staged$stashed$ahead$new"
  test "$flags"; and set flags " $flags"

  set -l flag_bg $__bobthefish_lt_green
  set -l flag_fg $__bobthefish_dk_green
  if test "$dirty" -o "$staged"
    set flag_bg $__bobthefish_med_red
    set flag_fg fff
  else
    if test "$stashed"
      set flag_bg $__bobthefish_lt_orange
      set flag_fg $__bobthefish_dk_orange
    end
  end

  __bobthefish_path_segment (__bobthefish_project_dir)

  __bobthefish_start_segment $flag_bg $flag_fg
  set_color $flag_fg --bold
  echo -n -s (__bobthefish_git_branch) $flags ' '
  set_color normal

  set -l project_pwd  (__bobthefish_project_pwd)
  if test "$project_pwd"
    if test -w "$PWD"
      __bobthefish_start_segment 333 999
    else
      __bobthefish_start_segment $__bobthefish_med_red $__bobthefish_lt_red
    end

    echo -n -s $project_pwd ' '
  end
end

function __bobthefish_prompt_dir -d 'Display a shortened form of the current directory'
  __bobthefish_path_segment "$PWD"
end


# ===========================
# Apply theme
# ===========================

function fish_prompt -d 'bobthefish, a fish theme optimized for awesome'
  set -g RETVAL $status
  __bobthefish_prompt_status
  __bobthefish_prompt_user
  if __bobthefish_in_git
    __bobthefish_prompt_git
  else
    __bobthefish_prompt_dir
  end
  __bobthefish_finish_segments
end
