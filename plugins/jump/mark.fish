function mark
  if test (count $argv) -eq 0 -o (count $argv) -gt 2
    echo "Usage: mark <MARK_NAME> [DIRECTORY]"
  else if test -e $MARKPATH/$argv[1]
    if test -d $MARKPATH/$argv[1] -a -L $MARKPATH/$argv[1]
      echo "A mark named $argv[1] already exists."
    else
      echo "$MARKPATH/$argv[1] already exists."
    end
  else if test (count $argv) -eq 1
    command ln -s (pwd) $MARKPATH/$argv[1]
  else if test (count $argv) -eq 2
    if test -d $argv[2]
      set -l current_dir (pwd)
      cd $argv[2]
      command ln -s (pwd) $MARKPATH/$argv[1]
      cd $current_dir
    else
      echo "$argv[2] is not a valid directory."
    end
  end
end
