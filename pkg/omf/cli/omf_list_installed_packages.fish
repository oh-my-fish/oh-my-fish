# List all packages installed from the registry.
function omf_list_installed_packages
  for item in (basename $OMF_PATH/pkg/*)
    test $item = wa; or echo $item
  end
end
