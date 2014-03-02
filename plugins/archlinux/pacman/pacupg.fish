function pacupg -d "Synchronize with repositories before upgrading packages that are out of date on the local system."
  sudo pacman -Syu $argv
end
