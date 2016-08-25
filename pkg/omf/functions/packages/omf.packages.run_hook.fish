function omf.packages.run_hook -a path hook
  set -l hook_script "$path/hooks/$hook.fish"
  set package (basename $path)

  if test -e "$hook_script"
    pushd $path
    source "$hook_script"
    set -l code $status
    popd

    return $code
  end
end
