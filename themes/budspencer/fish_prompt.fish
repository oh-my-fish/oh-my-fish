# TODO: color definitions cleanup
# TODO: git improvements
# name: budspencer

# ----------------------------------------------------------------------------
# Utils
# ----------------------------------------------------------------------------

set -g __budspencer_display_rprompt 1

function __budspencer_git_branch_name -d "Return the current branch name"
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function fish_vi_prompt_cm --description "Displays the current mode"
  switch $fish_bind_mode
    case default
      set_color -b blue 000
      echo -n " NORMAL " 
      set_color -b 000 blue
    case insert
      set_color -b yellow 000
      echo -n " INSERT "
      set_color -b 000 yellow
    case visual
      set_color -b magenta 000
      echo -n " VISUAL "
      set_color -b 000 magenta
  end
end

function fish_prompt_symbols --description "Display symbols"
  set_color -o -b 073642
  echo -n "" 
  # indicator for vim parent process
  if set -q -x VIM
    set_color 6c71c4
    echo -n " V" 
  end
  # indicator for ranger parent process
  if set -q -x RANGER_LEVEL
    set_color 6c71c4
    echo -n " R" 
  end
  # background job indicator
  if [ (jobs | wc -l)  -gt 0 ]
    set_color 6c71c4 
    echo -n " ⚙" 
  end
  # write protection indicator
  if [ ! -w . ]
    set_color cb4b16 
    echo -n " " 
  end
  # status indicator
  if [ $last_status -eq 0 ]
    set_color green
    echo -n " ✔"
  else
    set_color red
    echo -n " ✘"
  end
  # superuser indicator
  if [ $USER = "root" ]
    set_color cb4b16 
    echo -n " ⚡" 
  end
  echo -n " "
  set_color -b normal 073642
end
# ----------------------------------------------------------------------------
# Prompts
# ----------------------------------------------------------------------------

function fish_prompt -d "Write out the left prompt of the budspencer theme"
  set -g last_status $status
  set -l basedir_name (basename (prompt_pwd))

  # Init colors

  set -l fcol_black   (set_color 000000)
  set -l fcol_base03  (set_color 002b36)
  set -l fcol_base02  (set_color 073642)
  set -l fcol_base01  (set_color 586e75)
  set -l fcol_base00  (set_color 657b83)
  set -l fcol_base0   (set_color 839496)
  set -l fcol_base1   (set_color 93a1a1)
  set -l fcol_base2   (set_color eee8d5)
  set -l fcol_base3   (set_color fdf6e3)
  set -l fcol_yellow  (set_color b58900)
  set -l fcol_orange  (set_color cb4b16)
  set -l fcol_red     (set_color red)
  set -l fcol_magenta (set_color d33682)
  set -l fcol_violet  (set_color 6c71c4)
  set -l fcol_blue    (set_color 268bd2)
  set -l fcol_cyan    (set_color 2aa198)
  set -l fcol_green   (set_color 859900)
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
  set -l bcol_red     (set_color -b red)
  set -l bcol_magenta (set_color -b d33682)
  set -l bcol_violet  (set_color -b 6c71c4)
  set -l bcol_blue    (set_color -b 268bd2)
  set -l bcol_cyan    (set_color -b 2aa198)
  set -l bcol_green   (set_color -b 859900)
  
  # Segments
  
  # vi mode
  # If vi_mode plugin or native vi mode is activated then print the vi mode
  # in the prompt.
  set -l ps_vi ""
#  if test -n "$vi_mode"
#    set ps_vi $colnormal"["$vi_mode$colnormal"]"
#  end
  if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings" 
    set ps_vi (fish_vi_prompt_cm)
  end

  # git
  # If inside a git repo then the pwd segment is replaced by the git
  # segment.
  # The git segment format is X:YI@Z:P(N) where:
  #   X is git
  #   Y is the current branch
  #   I is the information about the current repo state
  #   Z is the name of the repo
  #   P is the current working path basename (name of the current directory)
  #   C is the depth of the path starting from base directory of the repo
  # The displayed information is:
  #   Dirtiness is indicated by a little dot after the branch name.
  #   Unpushed commits are indicated with up arrows
  #   The number of unpushed commits is indicated right after the up arrows
  # If P = Z then P(C) is not displayed
  set -l ps_git ""
  set -l git_branch_name (__budspencer_git_branch_name)
  if test -n "$git_branch_name"
#    set -l git_repo_name (__budspencer_git_repo_name)
#    if test -n (__budspencer_is_git_dirty)
#      set git_info $git_info$colbred"·"
#    end
    set ps_git $bcol_base01 "" $fcol_black "  "$git_branch_name" " $fcol_base01 #"@"$colbred$git_repo_name
#    if test "$basedir_name" != "$git_repo_name"
#        set -l basedir_depth (echo (__budspencer_git_repo_base) | sed "s/\// /g" | wc -w)
#        set -l depth (echo (pwd) | sed "s/\// /g" | wc -w)
#        set depth (math $depth - $basedir_depth)
#        set ps_git $ps_git$colbwhite":"$colbgreen$basedir_name$colnormal"("$depth")"
#    end
  end

  set -l ps_symbols (fish_prompt_symbols)

  # Left Prompt

  echo -n -s $ps_vi $ps_git $ps_symbols '' ' '
end


