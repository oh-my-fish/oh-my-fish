# omf.packages.name <name-or-url>
# Derives the package name from a name, repository URL or path.
function omf.packages.name -a name_or_url
  set -l name (string replace -r '/+$' '' -- "$name_or_url" | string replace -r '^.*/' '')
  set name (string replace -r '^(omf-)?((plugin|pkg|theme)-)?' '' -- "$name" | string replace -r '\.git$' '')
  echo $name
end
