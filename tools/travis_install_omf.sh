#!/bin/sh

git () {
  case $1 in
    clone)
      command git "$@"
      if test "$TRAVIS_PULL_REQUEST" != "false"; then
        echo "! detecting a pull request !"
	echo "$ git -C $OMF_PATH fetch origin +refs/pull/$TRAVIS_PULL_REQUEST/merge:"
	git -C $OMF_PATH fetch origin +refs/pull/$TRAVIS_PULL_REQUEST/merge:
        echo "$ git -C $OMF_PATH checkout -qf FETCH_HEAD"
        git -C $OMF_PATH checkout -qf FETCH_HEAD
      fi
      ;;
    *)
      command git "$@"
      ;;
  esac
}

. $TRAVIS_BUILD_DIR/bin/install
