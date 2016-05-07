function omf.search.theme -a item -d "Search db/theme for the specified item"

  set -l available_theme (omf.packages.list --database --theme)
  echo (omf::under)"Themes"(omf::off)

  set -l regex "([A-Za-z0-9-]*)($item)([A-Za-z0-9-]*)"

  echo $available_theme | egrep -io $regex | column

end
