function omf_new -a option name
  switch $option
    case "p" "pkg" "pack" "packg" "package"
      set option "pkg"
    case "t" "th" "the" "thm" "theme" "themes"
      set option "themes"
    case "*"
      echo (omf::err)"$option is not a valid option."(omf::off) 1^&2
      return $OMF_INVALID_ARG
  end

  if not omf_util_valid_package "$name"
    echo (omf::err)"$name is not a valid package/theme name"(omf::off) 1^&2
    return $OMF_INVALID_ARG
  end

  if set -l dir (omf_util_mkdir "$option/$name")
    cd $dir

    set -l github (git config github.user)
    test -z "$github"; and set github "{{USER}}"

    set -l user (git config user.name)
    test -z "$user"; and set user "{{USER}}"

    omf_new_from_template "$OMF_PATH/pkg/omf/templates/$option" \
      $github $user $name

    echo (omf::em)"Switched to $dir"(omf::off)
  else
    echo (omf::err)"\$OMF_CUSTOM and/or \$OMF_PATH undefined."(omf::off) 1^&2
    exit $OMF_UNKNOWN_ERR
  end
end
