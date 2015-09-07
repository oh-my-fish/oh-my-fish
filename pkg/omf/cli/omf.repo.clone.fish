function omf.repo.clone -a url path
  command git clone --quiet $url $path
end
