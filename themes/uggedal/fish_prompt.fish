# name: Uggedal
function fish_prompt
  if test -n "$SSH_CONNECTION"
    printf '%s ' $HOSTNAME
  end

  printf '%s ' (prompt_pwd)
end
