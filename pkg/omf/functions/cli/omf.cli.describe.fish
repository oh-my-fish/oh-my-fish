function omf.cli.describe -a name
  switch (count $argv)
  case 1
    omf.packages.describe $name
    return 0
  case '*'
    echo (omf::err)"Invalid number of arguments"(omf::off)
    return 1
  end
end
