function omf_install_package
  for search in $argv
    if test -e $OMF_PATH/db/pkg/$search
      set target pkg/$search
    else if test -e $OMF_PATH/db/themes/$search
      set target themes/$search
    else
      set -l pkg (basename $search)
      if test -e $OMF_PATH/pkg/$pkg
        echo (omf::err)"Error: $pkg already installed."(omf::off) 1^&2
      else
        echo (omf::dim)"Trying to clone from URL..."(omf::err)
        git clone -q $search $OMF_PATH/pkg/$pkg
          and echo (omf::em)"✔ $pkg succesfully installed."(omf::off)
          or echo (omf::err)"$pkg is not a valid package/theme."(omf::off) 1^&2
      end
      continue
    end

    if test -e $OMF_PATH/$target
      echo (omf::dim)"Updating $search..."(omf::off)
      pushd $OMF_PATH/$target
      omf_util_sync "origin" >/dev/null ^&1
      popd
      echo (omf::em)"✔ $search up to date."(omf::off)
    else
      echo (omf::dim)"Installing $search..."(omf::off)
      git clone (cat $OMF_PATH/db/$target) $OMF_PATH/$target >/dev/null ^&1
        and echo (omf::em)"✔ $search succesfully installed."(omf::off)
        or echo (omf::err)"Could not install package."(omf::off) 1^&2
    end
  end
end
