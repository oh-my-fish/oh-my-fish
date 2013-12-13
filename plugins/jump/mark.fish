function mark
    if test (count $argv) -eq 1
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
    else
        echo "Usage: mark <MARK_NAME> [DIRECTORY]"
    end
end
