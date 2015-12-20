function omf.cli.destroy
  echo (omf::err)"This will destroy your Oh My Fish installation!"(omf::off)
  read -l decision -p 'echo -n "Are you sure you want to continue? (y/N) "'

  switch $decision
  case 'y' 'Y'
    omf.destroy
  case '*'
    echo (omf::err)"Aborted!"(omf::off)
  end
end
