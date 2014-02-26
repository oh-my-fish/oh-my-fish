function pacrem -d "Remove the specified package(s), its configuration(s) and unneeded dependencies"
  sudo pacman -Rns $argv
end
