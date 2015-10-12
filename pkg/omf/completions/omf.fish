# SYNOPSIS
#   Completions for Oh My Fish CLI

complete -c omf -f -d "Oh My Fish"

complete -c omf -f -n "__fish_seen_subcommand_from r rm remove"     -a (printf "%s " (omf.packages.list --installed))
complete -c omf -f -n "__fish_seen_subcommand_from d desc describe" -a (printf "%s " (omf.packages.list --database --plugin))
complete -c omf -f -n "__fish_seen_subcommand_from c cd"            -a (printf "%s " (omf.packages.list --installed))
complete -c omf -f -n "__fish_seen_subcommand_from i install"       -a (printf "%s " (omf.packages.list --available --plugin))
complete -c omf -f -n "__fish_seen_subcommand_from t theme"         -a (printf "%s " (omf.packages.list --database --theme))
complete -c omf -f -n "__fish_seen_subcommand_from help"            -a "install theme remove update list describe cd new submit destroy doctor"

complete -c omf -f -a list     -n "__fish_use_subcommand" -d "List local packages"
complete -c omf -f -a describe -n "__fish_use_subcommand" -d "Get information about what packages do"
complete -c omf -f -a install  -n "__fish_use_subcommand" -d "Install one or more packages"
complete -c omf -f -a theme    -n "__fish_use_subcommand" -d "List / Use themes"
complete -c omf -f -a remove   -n "__fish_use_subcommand" -d "Remove a theme or package"
complete -c omf -f -a update   -n "__fish_use_subcommand" -d "Update Oh My Fish"
complete -c omf -f -a cd       -n "__fish_use_subcommand" -d "Change directory to plugin/theme directory"
complete -c omf -f -a new      -n "__fish_use_subcommand" -d "Create a new package from a template"
complete -c omf -f -a submit   -n "__fish_use_subcommand" -d "Submit a package to the registry"
complete -c omf -f -a help     -n "__fish_use_subcommand" -d "Display this help"
complete -c omf -f -a destroy  -n "__fish_use_subcommand" -d "Remove Oh My Fish"
complete -c omf -f -a doctor   -n "__fish_use_subcommand" -d "Troubleshoot Oh My Fish"
