#!/usr/bin/env fish

# Takes color as first argument, and text to print as other arguments.
function colored
    set_color $argv[1]
    set -e argv[1]
    echo $argv
    set_color normal
end

if test -d ~/.oh-my-fish
    colored yellow -n You already have Oh My Fish installed.
    echo " You'll need to remove ~/.oh-my-fish if you want to install"
    exit
end

colored blue Cloning Oh My Fish...
type git >/dev/null
and git clone https://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
or begin
    echo git not installed
    exit
end

colored blue Looking for an existing fish config...
if test -f ~/.config/fish/config.fish
    colored yellow -n "Found ~/.config/fish/config.fish."
    colored green " Backing up to ~/.config/fish/config.orig"
    mv ~/.config/fish/config.{fish,orig}
end

colored blue "Using the Oh My Fish template file and adding it to ~/.config/fish/config.fish"
cp ~/.oh-my-fish/templates/config.fish ~/.config/fish/config.fish

colored green \
'          _
         | |
     ___ | |__    _ __ ___  _   _
    / _ \|  _ \  |  _ ` _ \| | | |
   | (_) | | | | | | | | | | |_| |
    \___/|_| |_| |_| |_| |_|\__, |
                             __/ |
                            |___/
'

# Print nice fish logo with colors.
echo '                   '(set_color F00)'___
    ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
  /T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')
  [ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')
   \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')
    \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)
     \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\
     '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
    (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
    '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
     '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
            '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                        '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                        (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                         (UU)'(set_color normal)

echo
echo
colored green ' ....is now installed.'

# Run shell after installation.
fish
