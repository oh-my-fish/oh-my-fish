function __omf.packages.install.success
  echo (omf::em)"✔ $argv successfully installed."(omf::off)
end

function __omf.packages.install.error
  echo (omf::err)"Could not install $argv."(omf::off) 1^&2
end

function __omf.packages.install.error.already
  echo (omf::err)"Error: $argv already installed."(omf::off) 1^&2
end

function omf.packages.install -a name_or_url

  if test \( -e $OMF_PATH/db/themes/$name_or_url \) -o (echo $name_or_url | grep theme-)
    set install_type "theme"
    set parent_path "themes"
  else
    set install_type "package"
    set parent_path "pkg"
  end

  if test -e $OMF_PATH/db/$parent_path/$name_or_url
    set name $name_or_url
    set url (cat $OMF_PATH/db/$parent_path/$name)
  else
    set name (omf.packages.name $name_or_url)
    set url $name_or_url
  end

  if test -e $OMF_PATH/$parent_path/$name
    if test "$install_type" = theme
      omf.theme.set $name
    else
      __omf.packages.install.error.already "$install_type $name_or_url"
      return $OMF_INVALID_ARG
    end
  else
    echo (omf::dim)"Installing $install_type $name"(omf::off)

    if omf.repo.clone $url $OMF_PATH/$parent_path/$name
      omf.bundle.install $OMF_PATH/$parent_path/$name/bundle
      omf.bundle.add $install_type $name_or_url
      __omf.packages.install.success "$install_type $name"

      if test "$install_type" = theme
        omf.theme.set $name
      end
    else
      __omf.packages.install.error "$install_type $name"
      return $OMF_UNKNOWN_ERR
    end
  end

  return 0
end
