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
#   --available-plugins
#     List all plugins available from the oh-my-fish Github repository
#   --available-themes
#     List all themes available from the oh-my-fish Github repository
#   --download-plugin [PLUGIN]
#     Download and install PLUGIN
#   --download-theme [THEME]
#     Download and install THEME
#
# DESCRIPTION
#   Manage all plugins and themes specified on the $fish_plugins
#   and $fish_theme variables
#
function omf.packages --argument-names options arg -d 'Manage all plugins and themes'
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
      if test -n "$fish_plugins"
        omf.log normal $fish_plugins
      end

      omf.log normal ''
      omf.log yellow 'Theme: '
      if test -n "$fish_theme"
        omf.log normal $fish_theme
      end
    case '--available-plugins'
      get_all_repos | grep "plugin-" | cut -d "-" -f 2- | sort | paste -sd ' ' -
    case '--available-themes'
      get_all_repos | grep "theme-"  | cut -d "-" -f 2- | sort | paste -sd ' ' -
    case '--download-plugin'
      omf.packages.install --plugin $arg
    case '--download-theme'
      omf.packages.install --theme $arg
    case '*'
      omf.log red 'Unknown option'
  end
end

function get_all_repos
  set url "https://api.github.com/orgs/oh-my-fish/repos"
  set page_count (curl -sI "$url?page=1&per_page=100" | sed -nr 's/^Link:.*page=([0-9]+)&per_page=100>; rel="last".*/\1/p')

  if echo $page_count | grep -vE '^[0-9]+$'
    echo "Could not access Github API" >&2
    exit 1
  end

  for i in (seq $page_count)
    curl -s "$url?page=$i&per_page=100" | grep \"name\" | tr \": " " | awk '{print $2}'
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
