function omf.update -a name
  function __omf.update.success
    echo (omf::em)"✔ $argv successfully updated."(omf::off)
  end

  function __omf.update.error
    echo (omf::err)"Could not update $argv."(omf::off) >&2
  end

  if test \( -e $OMF_PATH/themes/$name \) -o \( -e $OMF_CONFIG/themes/$name \)
    set install_type "theme"
    set parent_path "themes"
  else
    set install_type "package"
    set parent_path "pkg"
  end

  for path in {$OMF_PATH,$OMF_CONFIG}/pkg/$name
    not test -e "$path/.git"; and continue

    omf.repo.pull $path; and set return_success

    set -q return_success;
      and omf.bundle.install $path/bundle
  end

  set -q return_success; and __omf.update.success "$name"
end
