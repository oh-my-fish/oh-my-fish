function omf.packages.update -a name
  if set target_path (omf.packages.path $name)
    # Skip packages outside version control
    not test -e $target_path/.git;
      and return 0

    omf.repo.pull $target_path
    switch $status
      case 0
        omf.bundle.install $target_path/bundle
        echo (omf::em)"$name successfully updated."(omf::off)
        return 0
      case 1
        echo (omf::err)"Could not update $name."(omf::off) 1>&2
      case 2
        echo (omf::dim)"$name is already up-to-date."(omf::off)
        return 0
    end
  else
    echo (omf::err)"Could not find $name."(omf::off) 1>&2
  end

  return 1
end
