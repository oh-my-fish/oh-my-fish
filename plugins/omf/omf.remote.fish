# NAME
#   omf.remote - List remote plugins and themes
#
# SYNOPSIS
#   omf.remote [OPTIONS]
#
# OPTIONS
#   --plugins
#     List all available plugins
#   --themes
#     List all available themes
#
# DESCRIPTION
#   List remote plugins and themes from the oh-my-fish Github repository
#
function omf.remote --argument-names options -d 'List remote plugins and themes'
  set url "https://api.github.com/orgs/oh-my-fish/repos"
  set page_count (curl -sI "$url?page=1&per_page=100" | grep "^Link" | sed 's/Link:.*page=\([0-9]*\)&per_page=100>; rel="last".*/\1/')

  if echo $page_count | grep -vE '^[0-9]+$'
    echo "Could not access Github API" >&2
    exit 1
  end

  set repos ""
  for i in (seq $page_count)
    set answer (curl -s "$url?page=$i&per_page=100" | grep \"name\" | tr \": " " | awk '{print $2}')
    set repos "$answer $repos"
  end

  switch $options
    case '--plugins'
      echo $repos | tr ' ' "\\n" | grep "plugin-" | cut -d "-" -f 2- | sort | paste -sd " " -
    case '--themes'
      echo $repos | tr ' ' "\\n" | grep "theme-"  | cut -d "-" -f 2- | sort | paste -sd " " -
    case '*'
      omf.log red 'Unknown option'
  end
end
