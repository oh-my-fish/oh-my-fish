# SYNOPSIS
#   Completions for Oh My Fish CLI

function __omf_is_single_opt
  test (count (commandline -opc)) -le 1
end

function __omf_opt_is
  set -l cmd (commandline -opc)
  test (count $cmd) -gt 1; and contains -- $cmd[2] $argv
end

complete --no-files -c omf -d "Oh My Fish"

complete -c omf -n "__omf_opt_is q query"      -a (printf "%s " (set | awk '{ printf $1"\n"; }'))
complete -c omf -n "__omf_opt_is r rm remove"  -a (printf "%s " (omf_list_local_packages) (omf_list_installed_themes))
complete -c omf -n "__omf_opt_is g get"        -a (printf "%s " (omf_list_db_packages))
complete -c omf -n "__omf_opt_is u use"        -a (printf "%s " (omf_list_themes))

complete -c omf -a list    -n "__omf_is_single_opt" -d "List local packages"
complete -c omf -a get     -n "__omf_is_single_opt" -d "Install one or more packages"
complete -c omf -a use     -n "__omf_is_single_opt" -d "List / Apply themes"
complete -c omf -a remove  -n "__omf_is_single_opt" -d "Remove a theme or package"
complete -c omf -a update  -n "__omf_is_single_opt" -d "Update Oh My Fish"
complete -c omf -a new     -n "__omf_is_single_opt" -d "Create a new package from a template"
complete -c omf -a submit  -n "__omf_is_single_opt" -d "Submit a package to the registry"
complete -c omf -a query   -n "__omf_is_single_opt" -d "Query environment variables"
complete -c omf -a help    -n "__omf_is_single_opt" -d "Display this help"
complete -c omf -a version -n "__omf_is_single_opt" -d "Display version"
complete -c omf -a destroy -n "__omf_is_single_opt" -d "Remove Oh My Fish"
