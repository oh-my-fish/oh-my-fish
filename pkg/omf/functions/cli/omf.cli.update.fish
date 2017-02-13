function omf.cli.update
  set -l update_core
  set -l packages $argv
  if test (count $packages) -gt 0
    # If several packages are listed, only update core if "omf" is listed among them.
    # Also keep "omf" out of the list of packages to update.
    set index (contains -i -- omf $packages)
      and set -e packages[$index]
      or set -e update_core
  else
    set packages (omf.packages.list)
  end

  if set -q update_core
    omf.core.update

    if type -q omf.version
      set OMF_VERSION (omf.version)
    end

    if test $status -ne 1
      echo (omf::em)"Oh My Fish is up to date."(omf::off)
      echo (omf::em)"You are now using Oh My Fish version $OMF_VERSION."(omf::off)
    else
      echo (omf::err)"Oh My Fish failed to update."(omf::off)
      echo "Please open a new issue here → "(omf::em)"github.com/oh-my-fish/oh-my-fish/issues"(omf::off)
    end
  end

  omf.index.update
    or return 1

  for package in $packages
    omf.packages.update $package
  end

  # Opt-in flag for testing
  if set -q OMF_AUTO_RELOAD
    omf.reload
  end
end
