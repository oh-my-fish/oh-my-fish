function pacreps -d "Search for package(s) in the repositories"
  command pacman -Ss $argv
end
