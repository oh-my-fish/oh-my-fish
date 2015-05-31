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
#   --list
#     List all active packages
#
# DESCRIPTION
#   Manage all plugins and themes specified on the $fish_plugins
#   and $fish_theme variables
#
function omf.packages --argument-names options -d 'Manage all plugins and themes'
  set -g __omf_packages_modified 0

  switch $options
    case '--install'
      for plugin in $fish_plugins
        omf.packages.install --plugin $plugin
      end

      omf.packages.install --theme $fish_theme

      if [ $__omf_packages_modified -eq 0 ]
        omf.log green 'All packages were already installed.'
      end
    case '--update'
      for plugin in $fish_plugins
        omf.packages.update --plugin $plugin
      end

      omf.packages.update --theme $fish_theme

      if [ $__omf_packages_modified -eq 0 ]
        omf.log green 'All packages were already updated'
      end
    case '--list'
      omf.log yellow 'Plugins: '
      omf.log normal $fish_plugins

      omf.log normal ''
      omf.log yellow 'Theme: '
      omf.log normal $fish_theme
    case '*'
      omf.log red 'Unknown option'
  end
end

function omf.packages.report.installing -e omf_package_installing
  omf.log -n white "Installing $argv... "
end

function omf.packages.report.updating -e omf_package_updating
  omf.log -n white "Updating $argv... "
end

function omf.packages.report.failed -e omf_package_install_failed -e omf_package_update_failed
  omf.log red "✖"

  set_color yellow
  cat /tmp/oh-my-fish.clone.log
  echo -e ''
  set_color normal

  set __omf_packages_modified (expr $__omf_packages_modified + 1)
end

function omf.packages.report.finished -e omf_package_installed -e omf_package_updated
  omf.log green "✔"
  set __omf_packages_modified (expr $__omf_packages_modified + 1)
end
