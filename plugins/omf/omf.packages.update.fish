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
        omf.log -n white "Updating $name "
        echo (cd $fish_path/plugins/$name; and git pull --rebase > /dev/null) >/dev/null
        omf.log green  "√"
        emit omf_package_updated
      else
        if [ -e $fish_custom/plugins/$name -a -e $fish_custom/plugins/$name/.git ]
          omf.log -n white "Updating $name "
          echo (cd $fish_custom/plugins/$name; and git pull --rebase > /dev/null) >/dev/null
          omf.log green  "√"
          emit omf_package_updated
        else
          #echo "Plugin is not installed or not a git repo. Skipping."
        end
      end
    case '--theme'
      if [ -e $fish_path/themes/$name -a -e $fish_path/themes/$name/.git ]
        omf.log -n white "Updating $name "
        echo (cd $fish_path/themes/$name; and git pull --rebase > /dev/null) >/dev/null
        omf.log green  "√"
        emit omf_package_updated
      else
        if [ -e $fish_custom/themes/$name -a -e $fish_custom/themes/$name/.git ]
          omf.log -n white "Updating $name "
          echo (cd $fish_custom/themes/$name; and git pull --rebase > /dev/null) >/dev/null
          omf.log green  "√"
          emit omf_package_updated
        else
          #echo "Theme is not installed or not a git repo. Skipping."
        end
      end
    case '*'
      omf.log red 'Unknown option'
  end

  popd # Restore current dir
end
