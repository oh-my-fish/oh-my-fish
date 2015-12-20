function omf.cli.update
  if omf.core.update
    echo (omf::em)"Oh My Fish is up to date."(omf::off)
  else
    echo (omf::err)"Oh My Fish failed to update."(omf::off)
    echo "Please open a new issue here → "(omf::em)"github.com/oh-my-fish/oh-my-fish/issues"(omf::off)
  end

  for package in (omf.packages.list --installed)
    omf.packages.update $package
  end
end
