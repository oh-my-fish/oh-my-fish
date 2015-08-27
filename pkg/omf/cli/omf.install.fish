function omf.install -a type_flag name_or_url
  switch $type_flag
    case "--theme"
      set install_type "theme"
      set parent_path "themes"
    case "--pkg"
      set install_type "package"
      set parent_path "pkg"
    case "*"
      echo (omf::err)"Argument to omf.install must be --theme [name|URL] or --pkg [name|URL]"(omf::off)
      return $OMF_INVALID_ARG
  end
  
  if test -e $OMF_PATH/db/$parent_path/$name_or_url
    set target $parent_path/$name_or_url
  else
    set -l local_name (basename $name_or_url)
    if test -e $OMF_PATH/$parent_path/$local_name
      echo (omf::err)"Error: $local_name $install_type already installed."(omf::off) 1^&2
    else
      echo (omf::dim)"Trying to clone from URL..."(omf::off)
      git clone -q $name_or_url $OMF_PATH/$parent_path/$local_name
      and echo (omf::em)"✔ $local_name $install_type succesfully installed."(omf::off)
      or begin
        echo (omf::err)"$local_name is not a valid $install_type."(omf::off) 1^&2
        return $OMF_INVALID_ARG
      end
    end
    return 0
  end

  if test -e $OMF_PATH/$target
    echo (omf::dim)"Updating $name_or_url $install_type..."(omf::off)
    pushd $OMF_PATH/$target
    omf.util_sync "origin" >/dev/null ^&1
    popd
    echo (omf::em)"✔ $name_or_url $install_type up to date."(omf::off)
  else
    echo (omf::dim)"Installing $name_or_url $install_type..."(omf::off)
    git clone (cat $OMF_PATH/db/$target) $OMF_PATH/$target >/dev/null ^&1
    and echo (omf::em)"✔ $name_or_url $install_type successfully installed."(omf::off)
    or begin
      echo (omf::err)"Could not install $install_type."(omf::off) 1^&2
      return $OMF_UNKNOWN_ERR
    end
  end
end
