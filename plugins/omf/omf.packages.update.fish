# NAME
#   omf.packages.update - Update a plugin or theme
#
# SYNOPSIS
#   --plugin <plugin_name>
#   --theme  <theme_name>
#
# DESCRIPTION
#   Update a plugin or theme
#
function omf.packages.update --argument-names type name -d "Update a plugin or theme"
  pushd # Save current dir

  switch $type
    case '--plugin'
      if [ -e $fish_path/plugins/$name -a -e $fish_path/plugins/$name/.git ]
        emit omf_package_updating $name
        omf.git --update $fish_path/plugins/$name
        emit omf_package_updated $name
      else
        if [ -e $fish_custom/plugins/$name -a -e $fish_custom/plugins/$name/.git ]
          emit omf_package_updating $name
          omf.git --update $fish_path/plugins/$name
          emit omf_package_updated $name
        else
          # Plugin is not installed or not a git repo. Skipping.
        end
      end
    case '--theme'
      if [ -e $fish_path/themes/$name -a -e $fish_path/themes/$name/.git ]
        emit omf_package_updating $name
        omf.git --update $fish_path/themes/$name
        emit omf_package_updated $name
      else
        if [ -e $fish_custom/themes/$name -a -e $fish_custom/themes/$name/.git ]
          emit omf_package_updating $name
          omf.git --update $fish_custom/themes/$name
          emit omf_package_updated $name
        else
          # Theme is not installed or not a git repo. Skipping.
        end
      end
    case '*'
      omf.log red 'Unknown option'
  end

  popd # Restore current dir
end
