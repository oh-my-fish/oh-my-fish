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

set git_style "symbols"
function fish_git_toggle_cm --description "Toggles style of git segment, press ,, in NORMAL mode"
  if test $git_style = "symbols"
    set git_style "counts"
  else
    set git_style "symbols"
  end
  commandline -f repaint
end
bind -M default ',,' fish_git_toggle_cm

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

function fish_cmd_duration_cm -d "Displays the elapsed time of last command"
  if test (count $CMD_DURATION) -gt 0
    set -l duration (echo $CMD_DURATION | tr -d '[[:space:]]' | sed 's|\.[[:digit:]]*||')
    if test $last_status -ne 0
      echo -n (set_color $budspencer_colors[3])""(set_color -b $budspencer_colors[3] $budspencer_colors[12])" "$duration
    else
      echo -n (set_color $budspencer_colors[3])""(set_color -b $budspencer_colors[3] $budspencer_colors[17])" "$duration
    end
  end
end

function fish_git_prompt_cm --description "Displays the git symbols"
  set -l git_prompt ""
  set -l is_repo (command git rev-parse --is-inside-work-tree ^/dev/null)
  if test $is_repo="true"

    set -l git_ahead_behind (__budspencer_is_git_ahead_or_behind)
    if test $git_ahead_behind[1] -gt 0
      if test $git_style = "symbols"
        set git_prompt (set_color -o $budspencer_colors[10])" ↑"
      else
        set git_prompt (set_color -o $budspencer_colors[10])" "$git_ahead_behind[1]
      end
    end

    if test $git_ahead_behind[2] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[10])" ↓"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[10])" "$git_ahead_behind[2]
      end
    end

    set -l git_status (__budspencer_git_status)
    if test $git_status[1] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[17])" +"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[17])" "$git_status[1]
      end
    end

    if test $git_status[2] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[12])" –"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[12])" "$git_status[2]
      end
    end

    if test $git_status[3] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[15])" ✱"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[15])" "$git_status[3]
      end
    end

    if test $git_status[4] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[13])" →"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[13])" "$git_status[4]
      end
    end

    if test $git_status[5] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[14])" ═"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[14])" "$git_status[5]
      end
    end

    if test $git_status[6] -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[9])" ●"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[9])" "$git_status[6]
      end
    end

    set -l git_stashed (__budspencer_is_git_stashed)
    if test git_stashed -gt 0
      if test $git_style = "symbols"
        set git_prompt $git_prompt(set_color -o $budspencer_colors[16])" ✭"
      else
        set git_prompt $git_prompt(set_color -o $budspencer_colors[16])" "$git_stashed
      end
    end
    echo $git_prompt

  end
end

function fish_pwd_prompt_cm --description "Displays the present working directory"
  set -l user_host " "
  if test (count $SSH_CLIENT) -gt 0
    set user_host " "$USER"@"(hostname)
    if test $pwd_style != "none"
      set user_host $user_host":"
    end
  end
  switch $fish_bind_mode
    case default
      set_color $budspencer_colors[15]
      echo -n ""
      set_color normal
      set_color -b $budspencer_colors[15] $budspencer_colors[1]
    case insert
      set_color $budspencer_colors[10]
      echo -n ""
      set_color normal
      set_color -b $budspencer_colors[10] $budspencer_colors[1]
    case visual
      set_color $budspencer_colors[13]
      echo -n ""
      set_color normal
      set_color -b $budspencer_colors[13] $budspencer_colors[1]
  end
  switch $pwd_style
    case none
      echo -n $user_host' '
    case short
      echo -n $user_host(prompt_pwd)' '
    case long
      echo -n $user_host$PWD' ' # | sed "s|$HOME|~|"
  end
  set_color normal
end

function fish_right_prompt -d "Write out the right prompt of the budspencer theme"

  # Segments

  # command duration
  set ps_duration (fish_cmd_duration_cm)

  # git
  set ps_git (fish_git_prompt_cm)
  if test -n "$ps_git"
    set ps_git (set_color $budspencer_colors[4])""(set_color -b $budspencer_colors[4])""$ps_git
  end

  # pwd
  set -l ps_pwd ""
  if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings"
    set ps_pwd (fish_pwd_prompt_cm)
  end

  echo -n $ps_duration $ps_git $ps_pwd
  set_color normal
end
