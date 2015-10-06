function omf.install_package
  for search in $argv
    omf.install $search
  end
end
