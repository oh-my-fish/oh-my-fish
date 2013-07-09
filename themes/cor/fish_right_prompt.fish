# Display git branch and dirty bit and current time on the right 

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_right_prompt
  set -l cyan (set_color cyan)
  set -l red (set_color red)
  set -l normal (set_color normal)
  set -l yellow (set_color cccc00)
  set -l green (set_color 80ff00)
  set -l pink (set_color ff99ff)
  set -l dark_pink (set_color cc99ff)
  

  # Show git branch and dirty state
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_is_git_dirty) ]
      echo -n -s $cyan '‹' $yellow $git_branch $red '*' $cyan '›' $normal
    else
		echo -n -s $cyan '‹' $yellow $git_branch $cyan '›' $normal
    end
  end
  
  echo -n -s $pink ' [' $dark_pink (date +%H:%M:%S) $pink '] '

end
