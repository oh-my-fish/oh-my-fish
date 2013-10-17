# name: FishFace

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)

  if [ (_git_branch_name) ]
    echo -n -s "$green><(((\"> "
  else
    echo -n -s "$blue><(((\"> "
  end
end
