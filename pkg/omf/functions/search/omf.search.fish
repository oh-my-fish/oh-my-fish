function omf.search -d "Search db for a certain package or theme"

  switch (count $argv);
    case 1;
      __omf.search.pkg $argv[1]
      echo
      __omf.search.theme $argv[1]
    case 2;
      switch "$argv[1]"
        case "-pkg" "--package";
          __omf.search.pkg $argv[2]
        case "-t" "--theme";
          __omf.search.theme $argv[2]
        case '*';
          __omf.search.usage
      end
    case '*';
      __omf.search.usage
  end

end

function __omf.search.theme -a item -d "Search db/theme for the specified item"

  set -l available_theme (omf.packages.list --database --theme)
  echo (omf::under)"Themes"(omf::off)

  set -l regex "([A-Za-z0-9-]*)($item)([A-Za-z0-9-]*)"

  echo $available_theme | egrep -io $regex | column

end

function __omf.search.pkg -a item -d "Search db/pkg for the specified item"

  set -l available_pkg (omf.packages.list --database --plugin)
  echo (omf::under)"Packages"(omf::off)

  set -l regex "([A-Za-z0-9-]*)($item)([A-Za-z0-9-]*)"

  echo $available_pkg | egrep -io $regex | column

end

function __omf.search.usage -d "Print usage"

  echo (omf::err)"Usage: omf search ([-t | --theme]) ([-pkg | --package]) item"(omf::off)

end
