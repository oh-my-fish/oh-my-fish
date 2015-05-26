# NAME
#   fish.packages - Manage all plugins and themes
#
# SYNOPSIS
#   fish.packages [OPTIONS]
#
# OPTIONS
#   --install
#     Install all packages
#   --update
#     Update all packages
#
# DESCRIPTION
#   Manage all plugins and themes specified on the $fish_plugins
#   and $fish_theme variables
#
function fish.packages --argument-names options -d 'Manage all plugins and themes'
  set -l modified_packages 0

  switch $options
    case "--install"
      fish.packages.install
    case "--update"
      fish.packages.update
    case "*"
      fish.log red 'Unknown option'
  end
end
