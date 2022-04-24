function omf.packages.path -a name
  for path in {$OMF_CONFIG,$OMF_PATH}/{themes,pkg}/$name
    if test -e $path
      echo $path
      return 0
    end
  end

  return 1
end
