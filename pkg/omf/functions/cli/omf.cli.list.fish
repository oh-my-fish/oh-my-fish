function omf.cli.list
  switch (count $argv)
  case 0
    echo (omf::under)Plugins(omf::off)
    omf.packages.list --plugin | omf.columns
    echo
    echo (omf::under)Themes(omf::off)
    omf.packages.list --theme | omf.columns
  case '*'
    omf.packages.list $argv | omf.columns
  end
end
