# NAME
#   fish - Extend default fish binary
#
# DESCRIPTION
#   Extend fish binary to support plugins and themes installation
#
function fish -d "Extend fish binary"
  if test (count $argv) -gt 0
    switch $argv[1]
      case 'install'
        fish.packages --install
      case 'update'
        fish.packages --update
      case '*'
        command fish $argv
    end
  else
    command fish
  end
end
