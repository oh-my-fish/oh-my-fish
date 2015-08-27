function omf.theme
  if not test -e $OMF_CONFIG/themes/$argv[1]
    omf.install --theme $argv[1]
  end
  echo "$argv[1]" > $OMF_CONFIG/theme
end
