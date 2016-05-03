function omf.repo.clone -a url path
  set -l omf_repo_clone (command git clone --quiet $url $path 2>&1)

  if test $status -eq 0
    return 0
  else
    set omf_repo_clone_error (echo $omf_repo_clone  | cut -d':' -f{{2-}})
    return 128
  end
end
