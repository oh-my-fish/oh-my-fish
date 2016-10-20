function omf.channel.get
  # Check for an environment variable override.
  if set -q OMF_CHANNEL
    echo $OMF_CHANNEL
    return 0
  end

  # Check the channel file.
  if test -f $OMF_CONFIG/channel
    read -l channel < $OMF_CONFIG/channel
      and echo $channel
      and return 0
  end

  # Assume 'stable' if not specified.
  echo stable
end
