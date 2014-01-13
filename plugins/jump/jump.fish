function jump
  if test (count $argv) -ne 1
    echo "Usage: jump <MARK_NAME>"
  else
    if test -d $MARKPATH/$argv[1] -a -L $MARKPATH/$argv[1]
      cd $MARKPATH/$argv[1]
    else
      echo "No such mark: $argv[1]"
    end
  end
end
