#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset
#set -o xtrace

# Return if we are not in a Pull Request
if [[ "$TRAVIS_OS_NAME" = "linux" ]]; then
  sudo apt-add-repository -y ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get install -y fish
else
  brew update
  brew install fish tree
fi
