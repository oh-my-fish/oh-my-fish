#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset

if [[ $FISH_RELEASE = "brew" ]]; then
  brew update
  brew install fish
else
  if [[ $FISH_RELEASE == "4" ]]; then
    REPO_PPA="ppa:fish-shell/beta-4"
  else
    REPO_PPA="ppa:fish-shell/release-3"
  fi

  if [[ $FISH_RELEASE != "stock" ]]; then
    sudo apt-add-repository -y $REPO_PPA
  fi

  sudo apt-cache policy fish
  sudo apt-get update
  sudo apt-get install -y fish
fi

fish --version
