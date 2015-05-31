# NAME
#   omf.packages - Manage all plugins and themes
#
# SYNOPSIS
#   omf.packages [OPTIONS]
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
function omf.packages --argument-names options -d 'Manage all plugins and themes'
  set -l modified_packages 0

  switch $options
    case "--install"
      omf.packages.install
    case "--update"
      omf.packages.update
    case "*"
      omf.log red 'Unknown option'
  end
end
