function omf.packages.update -a name
  if set target_path (omf.packages.path $name)
    # Skip packages outside version control
    not test -e $target_path/.git;
      and return 0

    if omf.repo.pull $target_path
      omf.bundle.install $target_path/bundle
      echo (omf::em)"$name successfully updated."(omf::off)
      return 0
    else
      echo (omf::err)"Could not update $name."(omf::off) 1^&2
    end
  else
    echo (omf::err)"Could not find $name."(omf::off) 1^&2
  end

  return 1
end
