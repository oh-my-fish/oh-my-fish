function omf_list_installed_themes
  for item in (basename $OMF_PATH/themes/*)
    test $item = default; or echo $item
  end
end