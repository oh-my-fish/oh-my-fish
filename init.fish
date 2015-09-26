# SYNOPSIS
#   Initialize Oh My Fish.
#
# OVERVIEW
#   + Source $OMF_CONFIG/before.init.fish
#
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
#   ORIGINAL_PATH Original $PATH preseved across Oh My Fish reloads.
#   OMF_PATH      ~/.local/share/omf by default.
#   OMF_IGNORE    List of packages to ignore.
#   OMF_CONFIG    ~/.config/omf by default.
#   OMF_VERSION   Oh My Fish! version

# Save PATH before oh my fish for reseting the PATH when we reload OMF.
if set -q ORIGINAL_PATH
  set PATH $ORIGINAL_PATH
else
  set -gx ORIGINAL_PATH $PATH
end

# Set OMF_CONFIG if not set.
if not set -q OMF_CONFIG
  set -q XDG_CONFIG_HOME; or set -l XDG_CONFIG_HOME "$HOME/.config"
  set -gx OMF_CONFIG "$XDG_CONFIG_HOME/omf"
end

# Source custom before.init.fish file
source $OMF_CONFIG/before.init.fish ^/dev/null

# Save the head of function path and autoload core functions
set -l user_function_path $fish_function_path[1]
set fish_function_path[1] $OMF_PATH/lib

# Autoload util functions
autoload $OMF_PATH/lib $OMF_PATH/lib/git

for path in {$OMF_PATH,$OMF_CONFIG}/pkg/*
  set -l name (basename $path)

  contains -- $name $OMF_IGNORE; and continue
  require $name
end

# Autoload theme
autoload {$OMF_PATH,$OMF_CONFIG}/themes/(cat $OMF_CONFIG/theme)

# Autoload custom functions
autoload $OMF_CONFIG/functions
autoload $user_function_path

# Source custom init.fish file
source $OMF_CONFIG/init.fish ^/dev/null

set -g OMF_VERSION "1.0.0"
