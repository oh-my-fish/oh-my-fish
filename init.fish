# SYNOPSIS
#   Initialize Oh My Fish.
#
# ENV
#   OSTYPE        Operating system.
#   RESET_PATH    Original $PATH preseved across Oh My Fish refreshes.
#   OMF_PATH      Set in ~/.config/fish/config.fish
#   OMF_IGNORE    List of packages to ignore.
#   OMF_CUSTOM    Same as OMF_PATH. ~/.dotfiles by default.
#
# OVERVIEW
#   + Autoload Oh My Fish packages, themes and custom path
#   + For each <pkg> inside {$OMF_PATH,$OMF_CUSTOM}
#     + Autoload <pkg> directory
#     + Source <pkg>.fish
#     + Emit init_<pkg> event
#
#   + Autoload {$OMF_PATH,$OMF_CUSTOM}/functions
#   + Source {$OMF_PATH,$OMF_CUSTOM} → fish-shell/fish-shell/issues/845
#   + Source $OMF_CUSTOM/init.fish

if set -q RESET_PATH
  set PATH $RESET_PATH
else
  set -gx RESET_PATH $PATH
end

set -q OSTYPE; or set -g OSTYPE (uname)

# Save the head of function path and autoload Oh My Fish core functions
set -l user_function_path $fish_function_path[1]
set fish_function_path[1] $OMF_PATH/lib

set -l theme  {$OMF_PATH,$OMF_CUSTOM}/themes/(cat $OMF_CONFIG/theme)
set -l paths  $OMF_PATH/pkg/*
set -l custom $OMF_CUSTOM/pkg/*
set -l ignore $OMF_IGNORE

for path in $paths
  set custom $OMF_CUSTOM/(basename $path) $custom
end

for path in $OMF_PATH/lib $OMF_PATH/lib/git $paths $theme $custom
  contains -- (basename $path) $ignore; and continue
  autoload $path $path/completions
  source $path/(basename $path).fish
    and emit init_(basename $path) $path
end

autoload $OMF_CUSTOM/functions
autoload $user_function_path

source {$OMF_PATH,$OMF_CUSTOM}/events.fish
source $OMF_CUSTOM/init.fish
