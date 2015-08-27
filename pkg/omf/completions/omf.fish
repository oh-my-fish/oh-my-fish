# SYNOPSIS
#   Completions for Oh My Fish CLI

function __omf.is_single_opt
  test (count (commandline -opc)) -le 1
end

function __omf.opt_is
  set -l cmd (commandline -opc)
  test (count $cmd) -gt 1; and contains -- $cmd[2] $argv
end

complete --no-files -c omf -d "Oh My Fish"

complete -c omf -n "__omf.opt_is q query"      -a (printf "%s " (set | awk '{ printf $1"\n"; }'))
complete -c omf -n "__omf.opt_is r rm remove"  -a (printf "%s " (omf.list_local_packages) (omf.list_installed_themes))
complete -c omf -n "__omf.opt_is i install"    -a (printf "%s " (omf.list_db_packages))
complete -c omf -n "__omf.opt_is t theme"      -a (printf "%s " (omf.list_themes))

complete -c omf -a list    -n "__omf.is_single_opt" -d "List local packages"
complete -c omf -a install -n "__omf.is_single_opt" -d "Install one or more packages"
complete -c omf -a theme   -n "__omf.is_single_opt" -d "List / Use themes"
complete -c omf -a remove  -n "__omf.is_single_opt" -d "Remove a theme or package"
complete -c omf -a update  -n "__omf.is_single_opt" -d "Update Oh My Fish"
complete -c omf -a new     -n "__omf.is_single_opt" -d "Create a new package from a template"
complete -c omf -a submit  -n "__omf.is_single_opt" -d "Submit a package to the registry"
complete -c omf -a query   -n "__omf.is_single_opt" -d "Query environment variables"
complete -c omf -a help    -n "__omf.is_single_opt" -d "Display this help"
complete -c omf -a version -n "__omf.is_single_opt" -d "Display version"
complete -c omf -a destroy -n "__omf.is_single_opt" -d "Remove Oh My Fish"
