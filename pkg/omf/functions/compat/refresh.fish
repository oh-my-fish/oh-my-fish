function refresh -d "(deprecated) Refresh fish session by replacing current process"
  echo (status -t)[5] | read -la caller
  printf 'warning: function %srefresh%s is deprecated and will be removed soon.\n' \
  (set_color -u) (set_color normal)

  contains input $caller
    or echo $caller

  set -q CI
    and return 0

  type -q omf.reload
    and omf.reload

  # If omf.reload exist, current fish will be replaced via exec, so
  # the code below will never be reached. When it doesn't exist, the code
  # below, the deprecated method, will be used as fallback.

  history --save
  exec fish
end
