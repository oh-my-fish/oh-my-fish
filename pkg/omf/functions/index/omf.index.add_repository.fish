function omf.index.add_repository -a url branch -d 'Add a package repository'
  echo "$url $branch" >> $OMF_CONFIG/repositories
end
