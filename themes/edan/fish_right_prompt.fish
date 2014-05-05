# Display the compressed current working path on the right
# If the previous command returned any kind of error code, display that too

function fish_right_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l red (set_color -o red)
  set -l normal (set_color normal)

  echo -n -s $cyan (prompt_pwd)

  if test $last_status -ne 0
    set_color red
    printf ' %d' $last_status
    set_color normal
  end
end
