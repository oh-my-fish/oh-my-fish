function omf.channel.set -a name
  # If an argument is specified, set the update channel.
  if begin; test -z "$name"; or not contains -- $name stable dev; end
    echo (omf::err)"'$name' is not a valid channel."(omf::off) >&2
    return 1
  end

  echo $name > $OMF_CONFIG/channel
  echo "Update channel set to "(omf::em)"$name"(omf::off)"."
  echo "To switch to the latest $name version, run "(omf::em)"omf update"(omf::off)"."
end
