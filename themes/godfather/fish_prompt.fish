# fish theme: goddy

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

# change color depending on the user.
function _user_host
  if [ (id -u) = "0" ];
    echo -n (set_color -o red)
  else
    echo -n (set_color -o blue)
  end
  echo -n (hostname|cut -d . -f 1)ˇ$USER (set color normal)
end

function fish_prompt
  set fish_greeting
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l cwd $cyan(basename (prompt_pwd))

  # output the prompt, left to right:
  # display 'user@host:'
  echo -n -s $green (whoami) $dark_green @ $green (hostname|cut -d . -f 1) ": "

  # display the current directory name:
  echo -n -s $cwd $normal

  # show git branch and dirty state, if applicable:
  if [ (_git_branch_name) ]
    set -l git_branch '[' (_git_branch_name) ']'

    if [ (_is_git_dirty) ]
      set git_info $red $git_branch "×"
    else
      set git_info $green $git_branch
    end
    echo -n -s ' ' $git_info $normal
  end

  # terminate with a nice prompt char:
  echo -n -s ' » ' $normal

end
