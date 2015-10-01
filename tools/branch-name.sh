#!/usr/bin/env sh

URL=https://api.github.com/repos/$TRAVIS_REPO_SLUG/pulls/$TRAVIS_PULL_REQUEST

BRANCH_NAME=`curl -s $URL ^/dev/null \
    | grep -C 2 "head" \
    | grep \"ref\" \
    | cut -d':' -f2- \
    | sed -e 's/["|,]//g;s/^[ \t]//g'
  `

if [ -n "$BRANCH_NAME" ]; then
  echo $BRANCH_NAME
else
  echo $TRAVIS_BRANCH
fi
