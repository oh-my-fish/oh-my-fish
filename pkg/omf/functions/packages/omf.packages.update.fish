function omf.packages.update -a name
  if not set target_path (omf.packages.path $name)
    echo (omf::err)"Could not find $name."(omf::off) >&2
    return 1
  end

  # Only pull packages in version control
  if test -e $target_path/.git
    omf.repo.pull $target_path
    switch $status
      case 0
        omf.bundle.install $target_path/bundle
        set result (omf::em)"$name successfully updated."(omf::off)
      case 1
        echo (omf::err)"Could not update $name."(omf::off) >&2
        return 1
      case 2
        set result (omf::dim)"$name is already up-to-date."(omf::off)
    end
  end

  # Run update hook.
  if not omf.packages.run_hook $target_path update
    echo (omf::err)"Could not update $name."(omf::off) >&2
    return 1
  end

  if set -q result
    echo $result
  end
  return 0
end
