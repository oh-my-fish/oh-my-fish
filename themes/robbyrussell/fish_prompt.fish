function fish_prompt
  if [ (git_branch_name) ]
    if [ (is_git_dirty) ]
      set git_dirty "✗"
    end

    printf '%s➜ %s %s git:(%s%s%s) %s ' (set_color red) (set_color blue) (basename (prompt_pwd)) (set_color red) (git_branch_name) (set_color blue) $git_dirty
  else
    printf '%s➜ %s %s ' (set_color red) (set_color blue) (basename (prompt_pwd))
  end
end

