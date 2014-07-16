# name: syl20bnr

# ----------------------------------------------------------------------------
# Utils
# ----------------------------------------------------------------------------

set -g __syl20bnr_display_rprompt 1

function toggle_right_prompt -d "Toggle the right prompt of the syl20bnr theme"
  if test $__syl20bnr_display_rprompt -eq 0
    echo "enable right prompt"
    set __syl20bnr_display_rprompt 1
  else
    echo "disable right prompt"
    set __syl20bnr_display_rprompt 0
  end
end

function __syl20bnr_git_branch_name -d "Return the current branch name"
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function __syl20bnr_git_repo_name -d "Return the current repository name"
  echo (command basename (git rev-parse --show-toplevel ^/dev/null))
end

function __syl20bnr_git_repo_base -d "Return the current repository name"
  echo (command git rev-parse --show-toplevel ^/dev/null)
end

function __syl20bnr_is_git_dirty -d "Check if there is uncommited changes"
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function __syl20bnr_is_git_ahead -d "Check if there is unpushed commits"
  echo (command git status -s -b ^/dev/null | grep ahead)
end

function __syl20bnr_unpushed_commit_count -d "Return the number of unpushed commits"
  git status -s -b ^/dev/null | grep -E -o "ahead\ [0-9]+" | awk '{print $2}'
end

function fish_vi_prompt_cm --description "Displays the current mode"
  switch $fish_bind_mode
    case default
      set_color --bold --background red white
      echo "[N]"
    case insert
      set_color --bold --background green white
      echo "[I]"
    case visual
      set_color --bold --background magenta white
      echo "[V]"
  end
  set_color normal
end

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------

alias trp toggle_right_prompt

# ----------------------------------------------------------------------------
# Prompts
# ----------------------------------------------------------------------------

function fish_prompt -d "Write out the left prompt of the syl20bnr theme"
  set -l last_status $status
  set -l basedir_name (basename (prompt_pwd))

  # Init colors

  set -l colcyan   (set_color cyan)
  set -l colbcyan  (set_color -o cyan)
  set -l colgreen  (set_color green)
  set -l colbgreen (set_color -o green)
  set -l colnormal (set_color normal)
  set -l colred    (set_color red)
  set -l colbred   (set_color -o red)
  set -l colwhite  (set_color white)
  set -l colbwhite  (set_color -o white)
  
  # Segments
  
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
  set -l git_branch_name (__syl20bnr_git_branch_name)
  if test -n "$git_branch_name"
    set -l git_repo_name (__syl20bnr_git_repo_name)
    set -l git_info ""
    if test -n (__syl20bnr_is_git_ahead)
      set git_info $colbgreen"↑↑↑"$colnormal"("(__syl20bnr_unpushed_commit_count)")"
    end
    if test -n (__syl20bnr_is_git_dirty)
      set git_info $git_info$colbred"·"
    end
    set ps_git $colbwhite"git:"$colbcyan$git_branch_name$git_info$colnormal"@"$colbred$git_repo_name
    if test "$basedir_name" != "$git_repo_name"
        set -l basedir_depth (echo (__syl20bnr_git_repo_base) | sed "s/\// /g" | wc -w)
        set -l depth (echo (pwd) | sed "s/\// /g" | wc -w)
        set depth (math $depth - $basedir_depth)
        set ps_git $ps_git$colbwhite":"$colbgreen$basedir_name$colnormal"("$depth")"
    end
  end

  # pwd
  # The pwd segment format is X:P(C) where:
  #   X is either home or /
  #   P is the current working path basename (name of the current directory)
  #   C is the depth of the path starting from X
  # If the pwd is home or / then the prompt format is simplified to 'home' or
  # '/' without the current directory and depth.
  set -l ps_pwd ""
  if test -z "$ps_git"
    set -l depth (echo (pwd) | sed "s/\// /g" | wc -w)
    set -l in_home (echo (pwd) | grep ~)
    if test -n "$in_home"
      set ps_pwd $colbwhite"home"
    else
      set ps_pwd $colbwhite"/"
    end
    if test (echo (pwd)) != ~ -a (echo (pwd)) != /
      set ps_pwd $ps_pwd":"$colgreen$basedir_name
      if test -n "$in_home"
        set depth (math $depth - 2)
      end
      set ps_pwd $ps_pwd$colnormal"("$depth")"
    end
  end
      
  # vi mode
  # If vi_mode plugin or native vi mode is activated then print the vi mode
  # in the prompt.
  set -l ps_vi ""
  if test -n "$vi_mode"
    set ps_vi $colnormal"["$vi_mode$colnormal"]"
  end
  if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings" 
    set ps_vi (fish_vi_prompt_cm)
  end

  # end of prompt
  # The color of the end of the prompt depends on the $status value of the
  # last executed command. It is green or red depending on the last command
  # success or failure respectively.
  # Since I often use ranger and use its 'shift+s' key binding to bring a shell
  # session, there is discreet indicator when the parent process of the current
  # shell pid is a ranger process. In this case the end of the prompt is written
  # twice.
  # With this indicator I can quickly remember that I can "ctrl+d" to end the
  # the current shell process and get back to the ranger process.
  set -l ps_end ">"
  # indicator for ranger parent process
  set -l ranger ""
  set -l os (uname)
  if test "$os" = "Darwin"
    if pstree -s ranger | grep (echo %self) | grep -v grep > /dev/null
      set ranger 1
    end
  end
  if test "$os" = "Linux"
    if pstree -p -l | grep "fish("(echo %self)")" | grep 'ranger([0-9]*)' > /dev/null
      set ranger 1
    end
  end
  if test -n "$ranger"
    set ps_end $ps_end$ps_end
  end
  # last status give the color of the right arrows at the end of the prompt
  if test $last_status -ne 0 
    set ps_end $colnormal$colbred$ps_end
  else
    set ps_end $colnormal$colgreen$ps_end
  end

  # Left Prompt

  echo -n -s $ps_git $ps_pwd $ps_vi $ps_git_dirty $ps_end ' '
end


function fish_right_prompt -d "Write out the right prompt of the syl20bnr theme"
  set -l colnormal (set_color normal)

  # Segments

  # The where segment format is X@Y where:
  #   X is the username
  #   Y is the hostname
  set -l ps_where $colnormal(whoami)@(hostname|cut -d . -f 1)
  
  # Right Prompt

  if test $__syl20bnr_display_rprompt -eq 1
    echo -n -s $ps_where
  end
end

