# SYNOPSIS
#   Completions for Oh My Fish CLI

complete -c omf -f -d "Oh My Fish"

set -l installed_themes (omf.packages.list --theme)
set -l installed_plugins (omf.packages.list --plugin)
set -l installed $installed_themes $installed_plugins
for subcommand in "r rm remove" "c cd" "u update"
  complete -c omf -f -n "__fish_seen_subcommand_from $subcommand" -a "$installed_themes" -d theme
  complete -c omf -f -n "__fish_seen_subcommand_from $subcommand" -a "$installed_plugins" -d plugin
end

set -l available_themes (omf.index.query type:theme)
set -l available_plugins (omf.index.query type:plugin)
for subcommand in "i install" "d describe"
  complete -c omf -f -n "__fish_seen_subcommand_from $subcommand" -a "$available_themes" -d theme
  complete -c omf -f -n "__fish_seen_subcommand_from $subcommand" -a "$available_plugins" -d plugin
end

complete -c omf -f -n "__fish_seen_subcommand_from d desc describe" -a (printf "%s " (omf.index.query type:plugin))
complete -c omf -f -n "__fish_seen_subcommand_from t theme"         -a "$installed_themes"
complete -c omf -f -n "__fish_seen_subcommand_from channel"         -a "stable dev"
complete -c omf -f -n "__fish_seen_subcommand_from help"            -a "install theme remove update list describe cd new destroy doctor"

complete -c omf -f -a list     -n "__fish_use_subcommand" -d "List local packages"
complete -c omf -f -a describe -n "__fish_use_subcommand" -d "Get information about what packages do"
complete -c omf -f -a install  -n "__fish_use_subcommand" -d "Install one or more packages"
complete -c omf -f -a theme    -n "__fish_use_subcommand" -d "List / Use themes"
complete -c omf -f -a remove   -n "__fish_use_subcommand" -d "Remove a theme or package"
complete -c omf -f -a update   -n "__fish_use_subcommand" -d "Update Oh My Fish"
complete -c omf -f -a cd       -n "__fish_use_subcommand" -d "Change directory to plugin/theme directory"
complete -c omf -f -a new      -n "__fish_use_subcommand" -d "Create a new package from a template"
complete -c omf -f -a search   -n "__fish_use_subcommand" -d "Search the database for a theme, package or both"
complete -c omf -f -a help     -n "__fish_use_subcommand" -d "Display this help"
complete -c omf -f -a destroy  -n "__fish_use_subcommand" -d "Remove Oh My Fish"
complete -c omf -f -a doctor   -n "__fish_use_subcommand" -d "Troubleshoot Oh My Fish"
complete -c omf -f -a channel  -n "__fish_use_subcommand" -d "Gets or changes the update channel"
