# NAME
#   omf.packages.install - Install a plugin or theme
#
# SYNOPSIS
#   --plugin <plugin_name>
#   --theme  <theme_name>
#
# DESCRIPTION
#   Install a plugin or theme
#
function omf.packages.install --argument-names type name -d "Install a plugin or theme"
  switch $type
    case '--plugin'
      if [ -e $fish_path/plugins/$name -o -e $fish_custom/plugins/$name ]
        # Plugin is already installed. Skipping.
      else
        emit omf_package_installing $name
        omf.git --clone "https://github.com/oh-my-fish/plugin-$name" $fish_path/plugins/$name

        if [ $status -eq 0 ]
          emit omf_package_installed $name
        else
          emit omf_package_install_failed $name
        end
      end
    case '--theme'
      if [ -e $fish_path/themes/$name -o -e $fish_custom/themes/$name ]
        # Theme is already installed. Skipping.
      else
        emit omf_package_installing $name
        omf.git --clone "https://github.com/oh-my-fish/theme-$name" $fish_path/themes/$name

        if [ $status -eq 0 ]
          emit omf_package_installed $name
        else
          emit omf_package_install_failed $name
        end
      end
    case '*'
      omf.log red 'Unknown option'
  end
end
