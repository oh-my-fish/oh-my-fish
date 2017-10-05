function omf.cli.theme -a name
  switch (count $argv)
  case 0
    test -f $OMF_CONFIG/theme
      and read -l theme < $OMF_CONFIG/theme
      or set -l theme default

    set -l regex_current "(^|[[:space:]])($theme)([[:space:]]|\$)"
    set -l highlight_current s/"$regex_current"/"\1"(omf::em)"\2"(omf::off)"\3"/g

    echo (omf::under)"Installed:"(omf::off)
    omf.packages.list --theme | column | sed -E "$highlight_current"
    echo
    echo (omf::under)"Available:"(omf::off)
    omf.index.query --type=theme | column
  case 1
    if not omf.theme.set $name
      echo (omf::err)"Theme not installed!"(omf::off)
      echo Install it using (omf::em)omf install $name(omf::off)
      return $OMF_INVALID_ARG
    end
  case '*'
    echo (omf::err)"Invalid number of arguments"(omf::off) >&2
    echo "Usage: $_ "(omf::em)"$argv[1]"(omf::off)" [<theme name>]" >&2
    return $OMF_INVALID_ARG
  end
end
