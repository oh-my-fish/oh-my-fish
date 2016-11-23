function omf.core.update
  # If on the stable channel, checkout the latest tag.
  if test (omf.channel.get) = stable
    # If the channel isn't explicitly set and we are currently tracking a branch instead of a version, the user probably
    # upgraded from an old version. Let them know that we will start updating to stable versions.
    if begin; not test -f $OMF_CONFIG/channel; and command git -C "$OMF_PATH" symbolic-ref -q HEAD > /dev/null; end
      set_color yellow --bold ^ /dev/null
      echo ">> You have been switched to the stable release channel of Oh My Fish."
      echo ">> To switch back to the development channel, run `omf channel dev`."
      set_color normal ^ /dev/null
    end

    # Determine the remote to fetch from.
    set -l remote origin
    if test (command git -C "$OMF_PATH" config --get remote.upstream.url)
      set remote upstream
    end

    # Fetch the latest tags.
    command git -C "$OMF_PATH" fetch --quiet --tags $remote
      # Get the commit for the latest release.
      and set -l hash (command git -C "$OMF_PATH" rev-list --tags='v*' --max-count=1 ^ /dev/null)
      # Get the release tag.
      and set -l tag (command git -C "$OMF_PATH" describe --tags $hash)
      # Checkout the release.
      and command git -C "$OMF_PATH" checkout --quiet tags/$tag
      and return 0

    # Something went wrong.
    echo (omf::err)"No release versions found."(omf::off)
    return 1
  else
    # Determine the branch to use for the dev channel.
    set -q OMF_DEV_BRANCH
      or set -l OMF_DEV_BRANCH master

    # Switch to the master branch if we are in a detached head.
    command git -C "$OMF_PATH" symbolic-ref -q HEAD > /dev/null
      or command git -C "$OMF_PATH" checkout $OMF_DEV_BRANCH --quiet

    # Pull the latest for the current branch.
    omf.repo.pull $OMF_PATH
  end
end
