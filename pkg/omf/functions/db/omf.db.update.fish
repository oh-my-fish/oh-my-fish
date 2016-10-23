function omf.db.update -d 'Update the package database'
  set -l db_repo "http://github.com/oh-my-fish/db"
  set -l db_path $OMF_PATH/db
  set -l IFS ''

  echo -n "Updating package database... "

  if not test -d $db_path
    set output (command git clone --depth 1 $db_repo $db_path ^&1)
      and set success
  else
    set output (command git -C $db_path pull ^&1)
      and set success
  end

  if set -q success
    echo "Done!"
  else
    echo "Error"
    echo "$output"
    return 1
  end
end
