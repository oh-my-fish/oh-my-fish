function remove_backup_function
    functions -e old_$argv[1]

    rm $tmpname >/dev/null ^&1
    set -e tmpname
end
