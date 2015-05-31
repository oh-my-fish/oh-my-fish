# NAME
#   omf - Oh My Fish helper
#
# DESCRIPTION
#   Extend fish binary to support plugins and themes installation
#
function omf -d "Oh My Fish helper"
  if test (count $argv) -gt 0
    switch $argv[1]
      case 'install'
        omf.packages --install
      case 'update'
        omf.packages --update
      case 'list' 'ls'
        omf.packages --list
      case 'self-update'
        omf.git --update $fish_path

        if [ $status -eq 0 ]
          omf.log 'green' 'Oh My Fish has been successfully updated.'
        end
      case '*'
        omf.helper
    end
  else
    omf.helper
  end
end
