# TODO: color definitions
# TODO: elapsed time segment
# TODO: configurable pwd_style

function __budspencer_is_git_ahead -d "Check if there are unpushed commits"
  echo (command git status -s -b ^/dev/null | grep ahead)
end

function __budspencer_is_git_behind -d "Check if there are unpushed commits"
  echo (command git status -s -b ^/dev/null | grep behind)
end

function __budspencer_is_git_added -d "Check if there are added files"
  echo (command git status -s -b ^/dev/null | grep "^A")
end

function __budspencer_is_git_deleted -d "Check if there are deleted files"
  echo (command git status -s -b ^/dev/null | grep "^.D")
end

function __budspencer_is_git_changed -d "Check if there are changed files"
  echo (command git status -s -b ^/dev/null | grep "^.M")
end

function __budspencer_is_git_uncomitted -d "Check if there are uncommited changes"
  echo (command git status -s -b ^/dev/null | grep "^??")
end

function __budspencer_is_git_stashed -d "Check if there are stashed commits"
  echo (command git stash list ^/dev/null)
end

if set -q -x $PWDSTYLE
  set -x PWDSTYLE short long none
end
set pwd_style $PWDSTYLE[1]
function fish_pwd_toggle_cm --description "Toggles style of pwd segment, press space bar in NORMAL mode"
  for i in (seq 1 (count $PWDSTYLE))
    if test $PWDSTYLE[$i] = $pwd_style
      set pwd_style $PWDSTYLE[(math $i%(count $PWDSTYLE)+1)]
      commandline -f repaint
      break
    end
  end
end
bind -M default ' ' fish_pwd_toggle_cm

function fish_pwd_prompt_cm --description "Displays the present working directory"
  switch $fish_bind_mode
    case default
      set_color blue
      echo -n ""
      set_color normal
      set_color --background blue 000
    case insert
      set_color yellow
      echo -n ""
      set_color normal
      set_color --background yellow 000
    case visual
      set_color magenta
      echo -n ""
      set_color normal
      set_color --background magenta 000
  end
  switch $pwd_style
    case none
      echo -n ' '
    case short
      echo -n ' '(prompt_pwd)' '
    case long
      echo -n ' '$PWD' ' # | sed "s|$HOME|~|"
  end
  set_color normal
end

function fish_right_prompt -d "Write out the right prompt of the budspencer theme"
  # Init colors

  set -l fcol_black   (set_color 000000)
  set -l fcol_base03  (set_color -o 002b36)
  set -l fcol_base02  (set_color -o 073642)
  set -l fcol_base01  (set_color -o 586e75)
  set -l fcol_base00  (set_color -o 657b83)
  set -l fcol_base0   (set_color -o 839496)
  set -l fcol_base1   (set_color -o 93a1a1)
  set -l fcol_base2   (set_color -o eee8d5)
  set -l fcol_base3   (set_color -o fdf6e3)
  set -l fcol_yellow  (set_color -o b58900)
  set -l fcol_orange  (set_color -o cb4b16)
  set -l fcol_red     (set_color -o red) 
  set -l fcol_magenta (set_color -o d33682)
  set -l fcol_violet  (set_color -o 6c71c4)
  set -l fcol_blue    (set_color -o 268bd2)
  set -l fcol_blue    (set_color -o 268bd2)
  set -l fcol_cyan    (set_color -o 2aa198)
  set -l fcol_green   (set_color -o 859900)
  set -l bcol_base03  (set_color -b 002b36)
  set -l bcol_base02  (set_color -b 073642)
  set -l bcol_base01  (set_color -b 586e75)
  set -l bcol_base00  (set_color -b 657b83)
  set -l bcol_base0   (set_color -b 839496)
  set -l bcol_base1   (set_color -b 93a1a1)
  set -l bcol_base2   (set_color -b eee8d5)
  set -l bcol_base3   (set_color -b fdf6e3)
  set -l bcol_yellow  (set_color -b b58900)
  set -l bcol_orange  (set_color -b cb4b16)
  set -l bcol_red     (set_color -b dc322f)
  set -l bcol_magenta (set_color -b d33682)
  set -l bcol_violet  (set_color -b 6c71c4)
  set -l bcol_blue    (set_color -b 268bd2)
  set -l bcol_cyan    (set_color -b 2aa198)
  set -l bcol_green   (set_color -b 859900)
  
  # Segments

  # git
  set -l ps_git ""
  if test -n (__budspencer_is_git_ahead)
    set ps_git $fcol_yellow" ↑"
  end
  
  if test -n (__budspencer_is_git_behind)
    set ps_git $ps_git$fcol_yellow" ↓"
  end

  if test -n (__budspencer_is_git_added)
    set ps_git $ps_git$fcol_green" +"
  end

  if test -n (__budspencer_is_git_deleted)
    set ps_git $ps_git$fcol_red" –"
  end

  if test -n (__budspencer_is_git_changed)
    set ps_git $ps_git$fcol_blue" ✱"
  end

  if test -n (__budspencer_is_git_uncomitted)
    set ps_git $ps_git$fcol_base3" ●"
  end

  if test -n (__budspencer_is_git_stashed)
    set ps_git $ps_git$fcol_cyan" ✭"
  end

  if test -n "$ps_git"
    set ps_git $fcol_base02""$bcol_base02""$ps_git
  end

  # pwd 
  set -l ps_pwd ""
  if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings" 
    set ps_pwd (fish_pwd_prompt_cm)
  end

  echo -n $ps_git $ps_pwd
  set_color normal
end
