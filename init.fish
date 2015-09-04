# SYNOPSIS
#   Initialize Oh My Fish.
#
# OVERVIEW
#   + Autoload Oh My Fish packages, themes and config path
#   + For each <pkg> inside {$OMF_PATH,$OMF_CONFIG}
#     + Autoload <pkg> directory
#     + Source <pkg>.fish
#     + Emit init_<pkg> event
#
#   + Autoload {$OMF_PATH,$OMF_CONFIG}/functions
#   + Source $OMF_CONFIG/init.fish
#
# ENV
#   OSTYPE        Operating system.
#   RESET_PATH    Original $PATH preseved across Oh My Fish reloads.
#   OMF_PATH      ~/.local/share/omf by default.
#   OMF_IGNORE    List of packages to ignore.
#   OMF_CONFIG    ~/.config/omf by default.
#   OMF_VERSION   Oh My Fish! version

if set -q RESET_PATH
  set PATH $RESET_PATH
else
  set -gx RESET_PATH $PATH
end

set -q OSTYPE; or set -g OSTYPE (uname)

# Save the head of function path and autoload core functions
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
  source $path/(basename $path).fish ^/dev/null
    and emit init_(basename $path) $path
end

autoload $OMF_CONFIG/functions
autoload $user_function_path

# Source custom init.fish file
source $OMF_CONFIG/init.fish ^/dev/null

set -g OMF_VERSION "1.0.0"
