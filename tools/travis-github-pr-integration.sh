# Return if we are not in a Pull Request
if [[ "$TRAVIS_PULL_REQUEST" = "false" ]]; then
  export OMF_REPO_URI="https://github.com/$TRAVIS_REPO_SLUG"
  export OMF_REPO_BRANCH="$TRAVIS_BRANCH"
  return
fi

GITHUB_PR_URL=https://api.github.com/repos/$TRAVIS_REPO_SLUG/pulls/$TRAVIS_PULL_REQUEST
GITHUB_PR_BODY=$(curl -s $GITHUB_PR_URL ^/dev/null)

if [[ $GITHUB_PR_BODY =~ \"ref\":\ *\"([a-zA-Z0-9_-]*)\" ]]; then
  export OMF_REPO_BRANCH=${BASH_REMATCH[1]}
fi

if [[ $GITHUB_PR_BODY =~ \"repo\":.*\"clone_url\":\ *\"(https://github\.com/[a-zA-Z0-9_-]*/[a-zA-Z0-9_-]*\.git).*\"base\" ]]; then
  export OMF_REPO_URI=${BASH_REMATCH[1]}
fi
