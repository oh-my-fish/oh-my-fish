function pacrmorphans -d "Remove all real orphan packages"
  sudo pacman -Rs (pacman -Qtdq) $argv
end
