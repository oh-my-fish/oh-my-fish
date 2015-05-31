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
      case '*'
        omf.helper
    end
  else
    omf.helper
  end
end
