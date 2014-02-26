function paclocs -d "Search for package(s) in the local database"
  sudo pacman -Qs $argv
end
