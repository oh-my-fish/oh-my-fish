# List all custom packages and packages installed from the registry.
function omf.list_local_packages
  for item in (basename {$OMF_PATH,$OMF_CONFIG}/pkg/*)
    test $item = omf; or echo $item
  end
end
