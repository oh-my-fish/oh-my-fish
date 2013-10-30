#!/bin/bash

if [ -d ~/.oh-my-fish ]
then
  echo -e "\033[0;33mYou already have Oh My Fish installed.\033[0m You'll need to remove ~/.oh-my-fish if you want to install"
  exit
fi

echo -e "\033[0;34mCloning Oh My Fish...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish || {
  echo -e "git not installed"
  exit
}

echo -e "\033[0;34mLooking for an existing fish config...\033[0m"
if [ -f ~/.config/fish/config.fish ] || [ -h ~/.config/fish/config.fish ]
then
  echo -e "\033[0;33mFound ~/.config/fish/config.fish.\033[0m \033[0;32mBacking up to ~/.config/fish/config.orig\033[0m";
  mv ~/.config/fish/config.{fish,orig}
fi

echo -e "\033[0;34mUsing the Oh My Fish template file and adding it to ~/.config/fish/config.fish\033[0m"
cp ~/.oh-my-fish/templates/config.fish ~/.config/fish/config.fish


echo -e "\033[0;32m"'          _                           '"\033[0m"
echo -e "\033[0;32m"'         | |                          '"\033[0m"
echo -e "\033[0;32m"'     ___ | |__    _ __ ___  _   _     '"\033[0m"
echo -e "\033[0;32m"'    / _ \|  _ \  |  _ ` _ \| | | |    '"\033[0m"
echo -e "\033[0;32m"'   | (_) | | | | | | | | | | |_| |    '"\033[0m"
echo -e "\033[0;32m"'    \___/|_| |_| |_| |_| |_|\__, |    '"\033[0m"
echo -e "\033[0;32m"'                             __/ |    '"\033[0m"
echo -e "\033[0;32m"'                            |___/     '"\033[0m"
echo -e "\033[0;32m"'                                      '"\033[0m"
echo -e "\033[0;32m"'                   ___                '"\033[0m"
echo -e "\033[0;32m"'    ___======____=---=)               '"\033[0m"
echo -e "\033[0;32m"'  /T            \_--===)              '"\033[0m"
echo -e "\033[0;32m"'  [ \ (0)   \~    \_-==)              '"\033[0m"
echo -e "\033[0;32m"'   \      / )J~~    \-=)              '"\033[0m"
echo -e "\033[0;32m"'    \\___/  )JJ~~~   \)               '"\033[0m"
echo -e "\033[0;32m"'     \_____/JJ~~~~~    \              '"\033[0m"
echo -e "\033[0;32m"'     / \  , \J~~~~~     \             '"\033[0m"
echo -e "\033[0;32m"'    (-\)\=|\\\~~~~       L__          '"\033[0m"
echo -e "\033[0;32m"'    (\\)  (\\\)_           \==__      '"\033[0m"
echo -e "\033[0;32m"'     \V    \\\) ===_____   \\\\\\     '"\033[0m"
echo -e "\033[0;32m"'            \V)     \_) \\\\JJ\J\)    '"\033[0m"
echo -e "\033[0;32m"'                        /J\JT\JJJJ)   '"\033[0m"
echo -e "\033[0;32m"'                        (JJJ| \UUU)   '"\033[0m"
echo -e "\033[0;32m"'                         (UU)         '"\033[0m"

echo -e "\n\n \033[0;32m....is now installed.\033[0m"
/usr/bin/env fish
