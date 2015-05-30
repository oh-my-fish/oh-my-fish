# NAME
#   fish.packages.install - Install all plugins and themes
#
# DESCRIPTION
#   Install all plugins and themes specified on the $fish_plugins
#   and $fish_theme variables
#
function fish.packages.install -d "Install all plugins and themes"
  set -l installed_packages 0

  # Plugins
  for plugin in $fish_plugins
    if [ -e $fish_path/plugins/$plugin -o -e $fish_custom/plugins/$plugin ]
      #echo "$plugin is already installed. Skipping."
    else
      fish.log -n white "Installing $plugin... "
      git clone "https://github.com/oh-my-fish/plugins-$plugin" $fish_path/plugins/$plugin ^ /dev/null
      fish.log green  "√"
      set -l installed_packages 1
    end
  end

  # Theme
  if [ -e $fish_path/themes/$fish_theme -o -e $fish_custom/themes/$fish_theme ]
    #echo "$fish_theme is already installed. Skipping."
  else
    fish.log -n white "Installing $fish_theme... "
    git clone "https://github.com/oh-my-fish/themes-$fish_theme" $fish_path/themes/$fish_theme ^ /dev/null
    fish.log green  "√"
    set -l installed_packages 1
  end

  if [ $installed_packages -eq 0 ]
    fish.log green 'All plugins were already installed.'
  end
end
