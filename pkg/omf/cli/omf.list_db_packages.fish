# List all packages available to install from the registry.
function omf.list_db_packages -a skip_installed
  for item in (basename $OMF_PATH/db/pkg/*)
    if  begin
          test -z $skip_installed
          or not contains $item (basename {$OMF_PATH,$OMF_CONFIG}/pkg/*)
        end
      echo $item
    end
  end
end
