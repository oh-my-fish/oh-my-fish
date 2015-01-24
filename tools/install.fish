#!/usr/bin/env fish
#
# Oh-my-fish is a user-friendly framework for managing your fish-shell
# configuration. It includes optional plugins (brew, git, rails, python,
# node, etc) and themes.
#
# Get the party started with:
#
#   curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish \
#   | fish
#
# Oh-My-Fish currently supports
#
#   - Fish 2.0+ [fishshell.com] [github.com/fish-shell/fish-shell]
#
# The installation process is split up in the following steps:
#
#   1. Resolve source repository to default or get from environment variable.
#      This allows installers curl -L ..install.fish | TRAVIS_REPO_SLUG=<fork> fish in
#      order to test forks of the framework.
#
#   2. Check for already installed copies of Oh-My-Fish. Do not reinstall.
#
#   3. Attempt to pull repository via git clone, if git is not available,
#      curl a HTTP GET request directly from github.
#
#   4. Backup original configuration file if there is one and copy new
#      configuration file from templates/.
#
#   5. Print fish logo.
#
#   6. Start prompt if the terminal is interactive
#/

set fish_path    ~/.oh-my-fish
set config_path  ~/.config/fish

# Log a color message.
#   log <color> <string>...
function log
  echo -e (set_color $argv[1])$argv[2..-1](set_color normal)
end

log white "Installing Oh My Fish..."

# Allow installers to specify the source repository.
if not set -q TRAVIS_REPO_SLUG
  set TRAVIS_REPO_SLUG bpinto/oh-my-fish
  set TRAVIS_BRANCH master
end

# Abort installation if oh-my-fish is already installed.
if test -d $fish_path
  log yellow "You already have Oh My Fish installed."
  log white  "Remove $fish_path if you want to reinstall it."
  exit 1
end

# Either git clone or curl GET repository.
log blue "Cloning Oh My Fish from remote repository..."
if type git >/dev/null
  git clone -b $TRAVIS_BRANCH "https://github.com/$TRAVIS_REPO_SLUG.git" $fish_path
else
  log yellow "Install git to pull Oh-My-Fish updates"
  log white "Downloading remote zip from Github..."

  if curl -sLo $fish_path.zip "https://github.com/$TRAVIS_REPO_SLUG/archive/master.zip"
    unzip -q $fish_path.zip
    mv "oh-my-fish-master" $fish_path
      and log green "Oh-My-Fish succesfully downloaded and extracted to $fish_path"
    rm -f $fish_path.zip
  else
    log red "Oh-My-Fish could not be downloaded."
    log white "Report an issue → github.com/bpinto/oh-my-fish/issues"
    exit 1
  end
end

# Check any existing config.fish files, backup and add custom template.
log blue "Looking for an existing fish config..."
if test -f $config_path/config.fish
  log green "Found $config_path/config.fish."
  log green "Backing up to $config_path/config.orig"
  mv $config_path/config.{fish,orig}
end
log blue "Adding default configuration file to $config_path/config.fish"
cp $fish_path/templates/config.fish $config_path/config.fish

# Print nice fish logo with colors.
log green \
"         _
        | |
    ___ | |__    _ __ ___  _   _
   / _ \|  _ \  |  _ ` _ \| | | |
  | (_) | | | | | | | | | | |_| |
   \___/|_| |_| |_| |_| |_|\__, |
                            __/ |
                           |___/
"

echo "                     "(set_color F00)"___
      ___======____="(set_color FF7F00)"-"(set_color FF0)"-"(set_color FF7F00)"-="(set_color F00)")
    /T            \_"(set_color FF0)"--="(set_color FF7F00)"=="(set_color F00)")
    [ \ "(set_color FF7F00)"("(set_color FF0)"0"(set_color FF7F00)")   "(set_color F00)"\~    \_"(set_color FF0)"-="(set_color FF7F00)"="(set_color F00)")
     \      / )J"(set_color FF7F00)"~~    \\"(set_color FF0)"-="(set_color F00)")
      \\\\___/  )JJ"(set_color FF7F00)"~"(set_color FF0)"~~   "(set_color F00)"\)
       \_____/JJJ"(set_color FF7F00)"~~"(set_color FF0)"~~    "(set_color F00)"\\
       "(set_color FF7F00)"/ "(set_color FF0)"\  "(set_color FF0)", \\"(set_color F00)"J"(set_color FF7F00)"~~~"(set_color FF0)"~~     "(set_color FF7F00)"\\
      (-"(set_color FF0)"\)"(set_color F00)"\="(set_color FF7F00)"|"(set_color FF0)"\\\\\\"(set_color FF7F00)"~~"(set_color FF0)"~~       "(set_color FF7F00)"L_"(set_color FF0)"_
      "(set_color FF7F00)"("(set_color F00)"\\"(set_color FF7F00)"\\)  ("(set_color FF0)"\\"(set_color FF7F00)"\\\)"(set_color F00)"_           "(set_color FF0)"\=="(set_color FF7F00)"__
       "(set_color F00)"\V    "(set_color FF7F00)"\\\\"(set_color F00)"\) =="(set_color FF7F00)"=_____   "(set_color FF0)"\\\\\\\\"(set_color FF7F00)"\\\\
              "(set_color F00)"\V)     \_) "(set_color FF7F00)"\\\\"(set_color FF0)"\\\\JJ\\"(set_color FF7F00)"J\)
                          "(set_color F00)"/"(set_color FF7F00)"J"(set_color FF0)"\\"(set_color FF7F00)"J"(set_color F00)"T\\"(set_color FF7F00)"JJJ"(set_color F00)"J)
                          (J"(set_color FF7F00)"JJ"(set_color F00)"| \UUU)\\
                           (UU)"(set_color normal)\n\n

log green "...is now installed."

# Launch fish after installation, loading Oh My Fish for the first time.
# Safeguard for non-interactive terminals, automated installers, etc.
if status --is-interactive
  exec fish < /dev/tty
end
