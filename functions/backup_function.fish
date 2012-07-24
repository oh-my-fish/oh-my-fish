function backup_function
    set -l funcname $argv[1]

    if functions -q -- $funcname
        _create_tmpname
        functions -- $funcname | sed -e s/^function\ $funcname/function\ old_$funcname/ > $tmpname
        _source_old_function
    else
        _print_function_not_found $argv
        remove_backup_function $argv
        return 1
    end
end

function _create_tmpname
    set -l tmpdir /tmp

    set -g tmpname (printf "$tmpdir/fish_funced_%d_%d.fish" %self (random))
    while test -f $tmpname
        set -g tmpname (printf "$tmpdir/fish_funced_%d_%d.fish" %self (random))
    end
end

function _print_function_not_found
    set_color red
    _ "Function '$argv' not found.
"
    set_color normal
end

function _source_old_function
    . $tmpname
end
