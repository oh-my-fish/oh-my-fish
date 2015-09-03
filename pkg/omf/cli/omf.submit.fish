# SYNOPSIS
#   Submit a package to the registry
#
# OPTIONS
#   name  Name of the package.
#   [url] URL to the package repository.

function omf.submit -a name url -d "Submit a package to the registry"
  switch (dirname $name)
    case pkg
    case themes
    case "*"
      echo (omf::err)"Missing directory name: pkg/ or themes/"(omf::off) 1^&2
      return $OMF_INVALID_ARG
  end

  set -l pkg (basename $name)
  if not omf.util_valid_package $pkg
    echo (omf::err)"$pkg is not a valid package/theme name"(omf::off) 1^&2
    return $OMF_INVALID_ARG
  end

  if test -z "$url"
    echo (omf::em)"URL not specified, looking for a remote origin..."(omf::off) 1^&2
    set url (git config --get remote.origin.url)
    if test -z "$url"
      echo (omf::em)"$pkg remote URL not found"(omf::off) 1^&2
      echo "Try: git remote add <URL> or see Docs#Submitting" 1^&2
      return $OMF_INVALID_ARG
    end
  else
    if test -e "$OMF_PATH/db/$name"
      echo (omf::err)"Error: $pkg already exists in the registry!"(omf::off) 1^&2
      return $OMF_INVALID_ARG
    else
      echo "$url" > $OMF_PATH/db/$name
      echo (omf::em)"$pkg added to the local "(dirname $name)" registry."(omf::off)
      echo "Want to contribute? Send us a PR → github.com/oh-my-fish/oh-my-fish"
      return 0
    end
  end
end
