function pacmanallkeys -d "Get all keys for developers and trusted users"
  curl https://www.archlinux.org/developers/ https://www.archlinux.org/trustedusers/ | awk -F\" '(/pgp.mit.edu/) {sub(/.*search=0x/,"");print $1}' | xargs sudo pacman-key --recv-keys
end
