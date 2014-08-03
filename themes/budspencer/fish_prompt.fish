# TODO: git improvements
# name: budspencer

###############################################################################
# Color definitions
###############################################################################
  set -g budspencer_colors 000000 002b36 083743 445659 657b83 839496 93a1a1 eee8d5 fdf6e3 b58900 cb4b16 dc121f d33682 6c71c4 268bd2 2aa198 859900

###############################################################################
# Utils
###############################################################################

set -g __budspencer_display_rprompt 1

function __budspencer_git_branch_name -d "Return the current branch name"
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function fish_vi_prompt_cm --description "Displays the current mode"
  switch $fish_bind_mode
    case default
      set_color -b $budspencer_colors[15] $budspencer_colors[1]
      echo -en "\033]12;#$budspencer_colors[15]\007"
      echo -n " NORMAL "
      set_color -b $budspencer_colors[1] $budspencer_colors[15]
    case insert
      set_color -b $budspencer_colors[10] $budspencer_colors[1]
      echo -en "\033]12;#$budspencer_colors[10]\007"
      echo -n " INSERT "
      set_color -b $budspencer_colors[1] $budspencer_colors[10]
    case visual
      set_color -b $budspencer_colors[13] $budspencer_colors[1]
      echo -en "\033]12;#$budspencer_colors[13]\007"
      echo -n " VISUAL "
      set_color -b $budspencer_colors[1] $budspencer_colors[13]
  end
end

function fish_prompt_symbols --description "Display symbols"
  set_color -b $budspencer_colors[3]
  echo -n ""
  # indicator for vim parent process
  if set -q -x VIM
    set_color $budspencer_colors[14]
    echo -n " V"
  end
  # indicator for ranger parent process
  if set -q -x RANGER_LEVEL
    set_color $budspencer_colors[14]
    echo -n " R"
  end
  # background job indicator
  if [ (jobs | wc -l)  -gt 0 ]
    set_color $budspencer_colors[16]
    echo -n " ⚙"
  end
  # write protection indicator
  if [ ! -w . ]
    set_color $budspencer_colors[11]
    echo -n " "
  end
  # status indicator
  if [ $last_status -eq 0 ]
    set_color $budspencer_colors[17]
    echo -n " ✔"
  else
    set_color $budspencer_colors[12]
    echo -n " ✘"
  end
  # superuser indicator
  if [ $USER = "root" ]
    set_color $budspencer_colors[11]
    echo -n " ⚡"
  end
  echo -n " "
  set_color -b normal $budspencer_colors[3]
end
###############################################################################
# Prompts
###############################################################################

function fish_prompt -d "Write out the left prompt of the budspencer theme"
  set -g last_status $status
  set -l basedir_name (basename (prompt_pwd))

  # Segments

  # vi mode
  set -l ps_vi ""
  if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings"
    set ps_vi (fish_vi_prompt_cm)
  end

  # git
  set -l ps_git ""
  set -l git_branch_name (__budspencer_git_branch_name)
  if test -n "$git_branch_name"
    set ps_git (set_color -b $budspencer_colors[4]) "" (set_color $budspencer_colors[1]) "  "$git_branch_name" " (set_color $budspencer_colors[4]) #"@"$colbred$git_repo_name
  end

  set -l ps_symbols (fish_prompt_symbols)

  # Left Prompt

  echo -n -s $ps_vi $ps_git $ps_symbols '' ' '
end


