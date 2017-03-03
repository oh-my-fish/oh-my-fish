function omf.cli.themes.list
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
end
