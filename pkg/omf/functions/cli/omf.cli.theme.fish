function omf.cli.theme -a name
  switch (count $argv)
  case 0
    omf.cli.themes.list
  case 1
    omf.theme.set $name
  case '*'
    echo (omf::err)"Invalid number of arguments"(omf::off) 1^&2
    echo "Usage: $_ "(omf::em)"$argv[1]"(omf::off)" [<theme name>]" 1^&2
    return $OMF_INVALID_ARG
  end
end
