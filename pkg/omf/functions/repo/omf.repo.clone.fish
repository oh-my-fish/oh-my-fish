function omf.repo.clone -a url branch path
  if test -z "$branch"
    command git clone --quiet $url $path
  else
    command git clone --quiet $url -b $branch $path
  end
end
