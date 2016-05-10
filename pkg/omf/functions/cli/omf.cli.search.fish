function omf.cli.search -d "CLI parser for the search command"

  switch (count $argv);
    case 1;
      omf.search.pkg $argv[1]
      echo
      omf.search.theme $argv[1]
    case 2;
      switch "$argv[1]"
        case "-pkg" "--package";
          omf.search.pkg $argv[2]
        case "-t" "--theme";
          omf.search.theme $argv[2]
        case '*';
          __omf.cli.search.usage
      end
    case '*';
      __omf.cli.search.usage
  end
end

function __omf.cli.search.usage -d "Print usage"

  echo (omf::err)"Usage: omf search ([-t | --theme]) ([-pkg | --package]) item"(omf::off)

end
