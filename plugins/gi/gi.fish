function gi -d "gitignore.io cli for fish"
  if test $argv[1] = 'update-completions'
    _update_gi_completions
    return $status
  end

  set -l params (echo $argv|tr ' ' ',')
  curl -s https://www.gitignore.io/api/$params
end
