# List all packages available to install from the registry.
function omf.list_db_packages
  for item in (basename $OMF_PATH/db/pkg/*)
    contains $item (basename {$OMF_PATH,$OMF_CONFIG}/pkg/*); or echo $item
  end
end
