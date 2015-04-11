# name: trout

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _file_count
  ls -1 | wc -l | sed 's/\ //g'
end

function fish_prompt
  set -l last_status $status
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l green (set_color green)
  set -l magenta (set_color magenta)
  set -l normal (set_color normal)

  if [ (rbenv version-name) ]
    set ruby_version (rbenv version-name)
    set ruby_info "$red($ruby_version)$normal"
  end

  if [ (_git_branch_name) ]
    set -l git_branch $magenta(_git_branch_name)
    set git_info "$git_branch"

    if [ (_is_git_dirty) ]
      set git_info "$git_info$yellow*"
    end

    set git_info "$magenta($git_info$magenta)$normal"
  end

  if test $last_status = 0
    set prompt " $green☆$normal "
  else
    set prompt " $red☆$normal "
  end

  echo -n -s $ruby_info $git_info $prompt
end

function fish_right_prompt
  set -l blue (set_color blue)
  set -l normal (set_color normal)

  set -l path (pwd)
  set -l count (_file_count)
  set -l directory_info "($path ($count))"

  set -l time (date '+%I:%M')
  set -l time_info "$blue($time)$normal"

  echo -n -s $directory_info $time_info
end
