function omf.update -a type_flag name
  function __omf.update.process
    echo (omf::em)"Updating $argv..."(omf::off)
  end

  function __omf.update.success
    echo (omf::dim)"✔ $argv up to date."(omf::off)
  end

  function __omf.update.error
    echo (omf::err)"Could not update $argv."(omf::off) 1^&2
    return $OMF_UNKNOWN_ERR
  end

  function __omf.update.not_installed
    echo (omf::err)"Could not find $argv."(omf::off) 1^&2
    return $OMF_UNKNOWN_ERR
  end

  switch $type_flag
    case --theme
      set update_type "theme"
      set parent_path "themes"
    case --pkg
      set update_type "package"
      set parent_path "pkg"
    case *
      echo (omf::err)"Argument to omf.update must be --theme name or --pkg name"(omf::off)
      return $OMF_INVALID_ARG
  end

  if test -d $OMF_PATH/$parent_path/$name
    __omf.update.process $update_type $name
    pushd $OMF_PATH/$parent_path/$name
    omf.repo.pull
    popd
    __omf.update.success $update_type $name
  else
    __omf.update.not_installed $update_type $name
  end

end
