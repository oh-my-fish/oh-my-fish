function omf.install_package
  for search in $argv
    omf.install --pkg $search
  end
end
