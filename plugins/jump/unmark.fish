function unmark
  if test (count $argv) -eq 0
    echo "Usage: unmark <MARK_NAME>..."
  else
    for mark_name in $argv
      if test -d $MARKPATH/$mark_name -a -L $MARKPATH/$mark_name
        command rm -i $MARKPATH/$mark_name
      else
        echo "No such mark: $mark_name"
      end
    end
  end
end
