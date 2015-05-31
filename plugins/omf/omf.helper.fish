# NAME
#   omf.helper - Prints Oh My Fish help
#
# DESCRIPTION
#   Prints all functions supported by Oh My Fish helper
#
function omf.helper -d 'Prints all functions supported by Oh My Fish helper'
  omf.log normal 'Oh My Fish is a package manager for fish shell. This is a'
  omf.log normal 'basic help message containing pointers to more information.'
  omf.log normal ''
  omf.log normal '  Examples:'
  omf.log normal '    omf install'
  omf.log normal '    omf update'
  omf.log normal '    omf list'
  omf.log normal '    omf self-update'
end

