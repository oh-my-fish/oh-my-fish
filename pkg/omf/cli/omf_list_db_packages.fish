# List all packages available to install from the registry.
function omf_list_db_packages
  for item in (basename $OMF_PATH/db/pkg/*)
    contains $item (basename {$OMF_PATH,$OMF_CUSTOM}/pkg/*); or echo $item
  end
end
