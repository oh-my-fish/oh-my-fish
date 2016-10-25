function __omf.packages.install.success
  echo (omf::em)"✔ $argv successfully installed."(omf::off)
end

function __omf.packages.install.error
  echo (omf::err)"Could not install $argv."(omf::off) >&2
end

function __omf.packages.install.error.already
  echo (omf::err)"Error: $argv already installed."(omf::off) >&2
end

function omf.packages.install -a name_or_url
  if set url (omf.index.stat $name_or_url repository)
    set name $name_or_url
  else
    set name (omf.packages.name $name_or_url)
    set url $name_or_url
  end

  if contains -- $name (omf.packages.list)
    __omf.packages.install.error.already "$name_or_url"
    return $OMF_INVALID_ARG
  end

  echo (omf::dim)"Installing package $name"(omf::off)

  set -l install_dir $OMF_PATH/pkg/$name

  # Clone the package repository.
  if not omf.repo.clone $url $install_dir
    __omf.packages.install.error "$name"
    return $OMF_UNKNOWN_ERR
  end

  # Check if the package is a theme. If it is, move it to the themes directory.
  if test -f $install_dir/fish_prompt.fish
    test -d $OMF_PATH/themes
      or command mkdir -p $OMF_PATH/themes

    command mv $install_dir $OMF_PATH/themes/$name
    set install_dir $OMF_PATH/themes/$name
  end

  omf.bundle.install $install_dir/bundle
  omf.bundle.add package $name_or_url

  # Run the install hook.
  if not omf.packages.run_hook $install_dir install
    __omf.packages.install.error "$name"
    return $OMF_UNKNOWN_ERR
  end

  __omf.packages.install.success "$name"

  return 0
end
