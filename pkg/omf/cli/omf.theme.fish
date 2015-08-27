function omf.theme
  if not test -e $OMF_CONFIG/themes/$argv[1]
    if not test -e $OMF_PATH/themes/$argv[1]
      set -l theme $OMF_PATH/db/themes/$argv[1]
      if test -e $theme
        echo (omf::dim)"Downloading $argv[1] theme..."(omf::off)
        git clone (cat $theme) $OMF_PATH/themes/$argv[1] >/dev/null ^&1
          and echo (omf::em)"$argv[1] theme downloaded."(omf::off)
          or return $OMF_UNKNOWN_ERR
      else
        echo (omf::err)"$argv[1] is not a valid theme"(omf::off) 1^&2
        return $OMF_INVALID_ARG
      end
    end
  end
  echo "$argv[1]" > $OMF_CONFIG/theme
end
