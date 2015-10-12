function omf.describe -a name
  if test (count $argv) -eq 0
    for package in (omf.packages.list --database)
      echo $package - (omf.describe $package)
    end
  else
    set package_path $OMF_PATH/db/pkg/$name

    if test -e $package_path
      set url (cat $package_path)
      set repo (basename (dirname $url))/(basename $url)
      curl -s https://api.github.com/repos/$repo 2>/dev/null | grep \"description\" | head -1 | cut -d':' -f2- | sed -e 's/["|,]//g;s/^[ \t]//g'
    else
      echo (omf::err)"$name is not a valid pkg."(omf::off) 1^&2
      return $OMF_INVALID_ARG
    end
  end
end
