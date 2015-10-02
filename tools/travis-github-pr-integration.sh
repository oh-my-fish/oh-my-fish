# Return if we are not in a Pull Request
[[ "$TRAVIS_PULL_REQUEST" = "false" ]] && return

GITHUB_PR_URL=https://api.github.com/repos/$TRAVIS_REPO_SLUG/pulls/$TRAVIS_PULL_REQUEST
GITHUB_PR_BODY=$(curl -s $GITHUB_PR_URL 2>/dev/null)

if [[ $GITHUB_PR_BODY =~ \"ref\":\ *\"([a-zA-Z0-9_-]*)\" ]]; then
  export OMF_REPO_BRANCH=${BASH_REMATCH[1]}
fi

if [[ $GITHUB_PR_BODY =~ \"repo\":.*\"clone_url\":\ *\"(https://github\.com/[a-zA-Z0-9_-]*/[a-zA-Z0-9_-]*\.git).*\"base\" ]]; then
  export OMF_REPO_URI=${BASH_REMATCH[1]}
fi
