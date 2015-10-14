function omf.install -a type_flag name_or_url
  function _display_success
    echo (omf::em)"✔ $argv successfully installed."(omf::off)
  end

  function _display_error
    echo (omf::err)"Could not install $argv."(omf::off) 1^&2
  end

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
    set -l local_name (basename $name_or_url | sed "s/^pkg-//;s/^plugin-//;s/^theme-//;s/\.git\$//")
    if test -e $OMF_PATH/$parent_path/$local_name
      echo (omf::dim)"Updating $local_name $install_type..."(omf::off)
      omf.repo.pull $OMF_PATH/$parent_path/$local_name
      echo (omf::em)"✔ $local_name $install_type up to date."(omf::off)
    else
      echo (omf::dim)"Trying to clone from URL..."(omf::off)
      if omf.repo.clone $name_or_url $OMF_PATH/$parent_path/$local_name
        omf.bundle.add $install_type $name_or_url
        _display_success "$install_type $name_or_url"
      else
        _display_error "$install_type $name_or_url"
        return $OMF_UNKNOWN_ERR
      end
    end
    return 0
  end

  if test -e $OMF_PATH/$target
    echo (omf::dim)"Updating $name_or_url $install_type..."(omf::off)
    omf.repo.pull $OMF_PATH/$target
    echo (omf::em)"✔ $name_or_url $install_type up to date."(omf::off)
  else
    echo (omf::dim)"Installing $name_or_url $install_type..."(omf::off)
    if omf.repo.clone (cat $OMF_PATH/db/$target) $OMF_PATH/$target
      omf.bundle.add $install_type $name_or_url
      _display_success "$install_type $name_or_url"
    else
      _display_error "$install_type $name_or_url"
      return $OMF_UNKNOWN_ERR
    end
  end

  return 0
end
