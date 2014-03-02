function pacmir -d "Force refresh of all package lists after updating /etc/pacman.d/mirrorlist"
  sudo pacman -Syy $argv
end
