function omf.search.pkg -a item -d "Search db/pkg for the specified item"

  set -l available_pkg (omf.packages.list --database --plugin)
  echo (omf::under)"Packages"(omf::off)

  set -l regex "([A-Za-z0-9-]*)($item)([A-Za-z0-9-]*)"

  echo $available_pkg | egrep -io $regex | column

end
