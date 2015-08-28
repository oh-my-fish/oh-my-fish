# SYNOPSIS
#   Change the current working directory to plugin / theme home directory.
#
# OPTIONS
#   <name> Name of the package or theme.

function omf.cd -a name -d "Change the current working directory to plugin / theme home directory."
  if test -z $name
    pushd $OMF_PATH
    return 0
  end

  if test -e $OMF_CONFIG/pkg/$name
    pushd $OMF_CONFIG/pkg/$name
  else if test -e $OMF_CONFIG/themes/$name
    pushd $OMF_CONFIG/themes/$name
  else if test -e $OMF_PATH/pkg/$name
    pushd $OMF_PATH/pkg/$name
  else if test -e $OMF_PATH/themes/$name
    pushd $OMF_PATH/themes/$name
  else
    echo (omf::err)"$name is not a valid package/theme name"(omf::off) 1^&2
    return $OMF_INVALID_ARG
  end
end
