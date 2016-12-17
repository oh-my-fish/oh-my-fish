# SYNOPSIS
#   Change the current working directory to plugin / theme home directory.
#
# OPTIONS
#   <name> Name of the package or theme.

function omf.packages.cd -a name -d "Change the current working directory to plugin / theme home directory."
  if test -z "$name"
    pushd $OMF_PATH
    return 0
  end

  for path in {$OMF_CONFIG,$OMF_PATH}/{pkg,themes}/$name
    if test -e "$path"
      pushd $path
      return 0
    end
  end

  echo (omf::err)"$name is not a valid package/theme name"(omf::off) >&2
  return $OMF_INVALID_ARG
end
