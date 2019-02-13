function omf.repo.clone -a url branch path
  command git clone --quiet $url -b $branch $path
end
