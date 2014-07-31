# TODO: color definitions cleanup
# TODO: elapsed time segment
# TODO: username/host segment for ssh connections

  # Init colors

  set fcol_black   (set_color 000000)
  set fcol_base03  (set_color -o 002b36)
  set fcol_base02  (set_color -o 073642)
  set fcol_base01  (set_color -o 586e75)
  set fcol_base00  (set_color -o 657b83)
  set fcol_base0   (set_color -o 839496)
  set fcol_base1   (set_color -o 93a1a1)
  set fcol_base2   (set_color -o eee8d5)
  set fcol_base3   (set_color -o fdf6e3)
  set fcol_yellow  (set_color -o b58900)
  set fcol_orange  (set_color -o cb4b16)
  set fcol_red     (set_color -o red) 
  set fcol_magenta (set_color -o d33682)
  set fcol_violet  (set_color -o 6c71c4)
  set fcol_blue    (set_color -o 268bd2)
  set fcol_blue    (set_color -o 268bd2)
  set fcol_cyan    (set_color -o 2aa198)
  set fcol_green   (set_color -o 859900)
  set bcol_base03  (set_color -b 002b36)
  set bcol_base02  (set_color -b 073642)
  set bcol_base01  (set_color -b 586e75)
  set bcol_base00  (set_color -b 657b83)
  set bcol_base0   (set_color -b 839496)
  set bcol_base1   (set_color -b 93a1a1)
  set bcol_base2   (set_color -b eee8d5)
  set bcol_base3   (set_color -b fdf6e3)
  set bcol_yellow  (set_color -b b58900)
  set bcol_orange  (set_color -b cb4b16)
  set bcol_red     (set_color -b dc322f)
  set bcol_magenta (set_color -b d33682)
  set bcol_violet  (set_color -b 6c71c4)
  set bcol_blue    (set_color -b 268bd2)
  set bcol_cyan    (set_color -b 2aa198)
  set bcol_green   (set_color -b 859900)

function __budspencer_is_git_ahead_or_behind -d "Check if there are unpulled or unpushed commits"
  echo (command git rev-list --count --left-right "HEAD...@{upstream}" ^/dev/null | sed 's/[[:space:]+]/\\x1e/g')
end

function __budspencer_git_status -d "Check git status"
  set -l added 0
  set -l deleted 0
  set -l modified 0
  set -l renamed 0
  set -l unmerged 0
  set -l untracked 0
  set -l git_status (command git status --porcelain ^/dev/null)
  for i in (seq 1 (count $git_status))
    echo $git_status[$i] | egrep "^[ACDMT][\ MT]\ |^[ACMT]D\ " > /dev/null; and set added (math $added+1)
    echo $git_status[$i] | egrep "^[\ ACMRT]D\ " > /dev/null; and set deleted (math $deleted+1)
    echo $git_status[$i] | egrep "^.[MT]\ " > /dev/null; and set modified (math $modified+1)
    echo $git_status[$i] | egrep "^R.\ " > /dev/null; and set renamed (math $renamed+1)
    echo $git_status[$i] | egrep "^AA\ |^DD\ |^U.\ |^.U\ " > /dev/null; and set unmerged (math $unmerged+1)
    echo $git_status[$i] | egrep "^\?\?\ " > /dev/null; and set untracked (math $untracked+1)
  end
  printf '%s\x1e%s\x1e%s\x1e%s\x1e%s\x1e%s' $added $deleted $modified $renamed $unmerged $untracked
end

function __budspencer_is_git_stashed -d "Check if there are stashed commits"
  echo (command git stash list ^/dev/null | wc -l | awk '{print $1}')
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

set git_style "symbols"
function fish_git_toggle_cm --description "Toggles style of git segment, press G in NORMAL mode"
  if test $git_style = "symbols"
    set git_style "counts" 
  else
    set git_style "symbols"
  end
  commandline -f repaint
end
bind -M default ',,' fish_git_toggle_cm

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

function fish_git_prompt_cm --description "Displays the git symbols"
  set -l git_prompt ""
  set -l is_repo (command git rev-parse --is-inside-work-tree ^/dev/null)
  if test $is_repo="true" 

    set -l git_ahead_behind (__budspencer_is_git_ahead_or_behind)
    if test $git_ahead_behind[1] -gt 0
      if test $git_style = "symbols"
        set git_prompt $fcol_yellow" ↑"
      else
        set git_prompt $fcol_yellow" "$git_ahead_behind[1]
      end
    end
    
    if test $git_ahead_behind[2] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_yellow" ↓"
      else
        set git_prompt $git_prompt$fcol_yellow" "$git_ahead_behind[2]
      end
    end
    
    set -l git_status (__budspencer_git_status)
    if test $git_status[1] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_green" +"
      else
        set git_prompt $git_prompt$fcol_green" "$git_status[1]
      end
    end

    if test $git_status[2] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_red" –"
      else
        set git_prompt $git_prompt$fcol_red" "$git_status[2]
      end
    end

    if test $git_status[3] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_blue" ✱"
      else
        set git_prompt $git_prompt$fcol_blue" "$git_status[3]
      end
    end

    if test $git_status[4] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_magenta" →"
      else
        set git_prompt $git_prompt$fcol_magenta" "$git_status[4]
      end
    end

    if test $git_status[5] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_violet" ═"
      else
        set git_prompt $git_prompt$fcol_violet" "$git_status[5]
      end
    end

    if test $git_status[6] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_base3" ●"
      else
        set git_prompt $git_prompt$fcol_base3" "$git_status[6]
      end
    end

    set -l git_stashed (__budspencer_is_git_stashed)
    if test git_stashed -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt$fcol_cyan" ✭"
      else
        set git_prompt $git_prompt$fcol_cyan" "$git_stashed
      end
    end
    echo $git_prompt

  end
end

function fish_right_prompt -d "Write out the right prompt of the budspencer theme"
  
  # Segments

  # git
  set ps_git (fish_git_prompt_cm)
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
