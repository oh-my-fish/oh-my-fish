function mark
    if test (count $argv) -eq 1
        command ln -s (pwd) $MARKPATH/$argv[1]
    else if test (count $argv) -eq 2
        if test -d $argv[2]
            cd $argv[2]
            command ln -s (pwd) $MARKPATH/$argv[1]
            cd -
        else
            echo "$argv[2] is not a valid directory."
        end
    else
        echo "Usage: mark <MARK_NAME> [DIRECTORY]"
    end
end
