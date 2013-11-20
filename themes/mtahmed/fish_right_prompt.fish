# name: mtahmed
# Left prompt:
# - First 10 characters of hostname if ssh'ed
# - Current directory name
# - ─╼
# Right prompt:
# - Exit code of the previous command
function fish_right_prompt
  set -l last_status $status
  set_color $fish_color_cwd
  printf $last_status
end
