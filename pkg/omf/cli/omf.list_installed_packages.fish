# List all packages installed from the registry.
function omf.list_installed_packages
  for item in (basename $OMF_PATH/pkg/*)
    test $item = omf; or echo $item
  end
end
