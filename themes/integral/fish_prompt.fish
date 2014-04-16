# name: Integral
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _upstream_count
  echo (command git rev-list --count --left-right origin/(_git_branch_name)...HEAD ^/dev/null)
end

function _git_up_info
  if [ (_upstream_count) ]
    set -l count (_upstream_count)

    switch $count
      case "" # no upstream
        echo ''
      case "0?0" # equal to upstream
        echo ''
      case "0??" # ahead of upstream
        echo 'u+'(echo $count | cut -f2)
      case "??0" # behind upstream
        echo 'u-'(echo $count | cut -f1)
      case '???'      # diverged from upstream
        echo $count 'u+'(echo $count | cut -f2)'-'(echo $count | cut -f1)
      case '*'
        echo ''
    end
  end
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l blue (set_color blue)
  set -l yellow (set_color yellow)
  set -l normal (set_color normal)
  set -l green (set_color green)

  set -l arrow "∫"
  set -l cwd $blue(prompt_pwd)

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set -l git_vs_upstream (_git_up_info)

    if [ (_is_git_dirty) ]
      set git_info $yellow'('$git_branch "±" "$git_vs_upstream"')' $normal
    else if [ (_git_up_info) ]
      set git_info $yellow'('$git_branch "$git_vs_upstream"')' $normal
    else
      set git_info $green'('$git_branch')' $normal
    end
  end

  echo -n -s $cwd' '"$git_info" $normal $arrow ' '
end

function fish_right_prompt
  set -l dark_gray (set_color 222)
  
  echo -n -s $dark_gray ' ['(date +%H:%M:%S)'] '

end
