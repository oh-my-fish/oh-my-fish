function pacre -d "Remove the specified package(s), retaining its configuration(s) and required dependencies"
  sudo pacman -R $argv
end
