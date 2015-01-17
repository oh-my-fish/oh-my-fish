#!/usr/bin/env bash

if [ "$TRAVIS_OS_NAME" = "linux" ]; then
  ppa=ppa:fish-shell/$FISH_PPA
  sudo add-apt-repository -y $ppa
  sudo apt-get update
  sudo apt-get -y install fish
else
  brew install fish $BREW_OPTIONS
fi

curl -L https://github.com/$TRAVIS_REPO_SLUG/raw/$TRAVIS_BRANCH/tools/install.fish | fish
