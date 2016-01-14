function omf.packages.update -a name
  if not set target_path (omf.packages.path $name)
    echo (omf::err)"Could not find $name."(omf::off) 1>&2
    return 1
  end

  # Skip packages outside version control
  not test -e $target_path/.git;
    and return 0

  omf.repo.pull $target_path
  switch $status
    case 0
      omf.bundle.install $target_path/bundle
      echo (omf::em)"$name successfully updated."(omf::off)
    case 1
      echo (omf::err)"Could not update $name."(omf::off) 1>&2
      return 1
    case 2
      echo (omf::dim)"$name is already up-to-date."(omf::off)
  end

  return 0
end
