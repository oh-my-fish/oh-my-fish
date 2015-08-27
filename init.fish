# SYNOPSIS
#   Initialize Oh My Fish.
#
# ENV
#   OSTYPE        Operating system.
#   RESET_PATH    Original $PATH preseved across Oh My Fish refreshes.
#   OMF_PATH      Set in ~/.config/fish/config.fish
#   OMF_IGNORE    List of packages to ignore.
#   OMF_CONFIG    Same as OMF_PATH. ~/.config/omf by default.
#
# OVERVIEW
#   + Autoload Oh My Fish packages, themes and config path
#   + For each <pkg> inside {$OMF_PATH,$OMF_CONFIG}
#     + Autoload <pkg> directory
#     + Source <pkg>.fish
#     + Emit init_<pkg> event
#
#   + Autoload {$OMF_PATH,$OMF_CONFIG}/functions
#   + Source {$OMF_PATH,$OMF_CONFIG} → fish-shell/fish-shell/issues/845
#   + Source $OMF_CONFIG/init.fish

if set -q RESET_PATH
  set PATH $RESET_PATH
else
  set -gx RESET_PATH $PATH
end

set -q OSTYPE; or set -g OSTYPE (uname)

# Save the head of function path and autoload Oh My Fish core functions
set -l user_function_path $fish_function_path[1]
set fish_function_path[1] $OMF_PATH/lib

set -l theme  {$OMF_PATH,$OMF_CONFIG}/themes/(cat $OMF_CONFIG/theme)
set -l paths  $OMF_PATH/pkg/*
set -l config $OMF_CONFIG/pkg/*
set -l ignore $OMF_IGNORE

for path in $paths
  set config $OMF_CONFIG/(basename $path) $config
end

for path in $OMF_PATH/lib $OMF_PATH/lib/git $paths $theme $config
  contains -- (basename $path) $ignore; and continue
  autoload $path $path/completions
  source $path/(basename $path).fish
    and emit init_(basename $path) $path
end

autoload $OMF_CONFIG/functions
autoload $user_function_path

source {$OMF_PATH,$OMF_CONFIG}/events.fish
source $OMF_CONFIG/init.fish
