# NAME
#   fish.packages.update - Update all plugins and themes
#
# DESCRIPTION
#   Update all plugins and themes specified on the $fish_plugins
#   and $fish_theme variables
#
function fish.packages.update -d "Update all plugins and themes"
  set -l installed_packages 0
  pushd

  # Plugins
  for plugin in $fish_plugins
    if [ -e $fish_path/plugins/$plugin -a -e $fish_path/plugins/$plugin/.git ]
      fish.log -n white "Updating $plugin... "
      echo (cd $fish_path/plugins/$plugin; and git pull --rebase > /dev/null) >/dev/null
      fish.log green  "√"
      set -l installed_packages 1
    else
      if [ -e $fish_custom/plugins/$plugin -a -e $fish_custom/plugins/$plugin/.git ]
        fish.log -n white "Updating $plugin... "
        echo (cd $fish_custom/plugins/$plugin; and git pull --rebase > /dev/null) >/dev/null
        fish.log green  "√"
        set -l installed_packages 1
      else
        #echo "$plugin is not installed or not a git repo. Skipping."
      end
    end
  end

  # Theme
  if [ -e $fish_path/themes/$fish_theme -a -e $fish_path/themes/$fish_theme/.git ]
    fish.log -n white "Updating $fish_theme... "
    echo (cd $fish_path/themes/$fish_theme; and git pull --rebase > /dev/null) >/dev/null
    fish.log green  "√"
    set -l installed_packages 1
  else
    if [ -e $fish_custom/themes/$fish_theme -a -e $fish_custom/themes/$fish_theme/.git ]
      fish.log -n white "Updating $fish_theme... "
      echo (cd $fish_custom/themes/$fish_theme; and git pull --rebase > /dev/null) >/dev/null
      fish.log green  "√"
      set -l installed_packages 1
    else
      #echo "$fish_theme is not installed or not a git repo. Skipping."
    end
  end

  if [ $installed_packages -eq 0 ]
    fish.log green 'No plugins to update.'
  end

  popd
end
