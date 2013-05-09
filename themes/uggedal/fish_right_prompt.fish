function fish_right_prompt
  set -l last_status $status

  if test $last_status -ne 0
    set_color red
    printf '%d' $last_status
    set_color normal
  end
end
