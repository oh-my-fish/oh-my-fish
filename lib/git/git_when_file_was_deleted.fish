function git_when_file_was_deleted -d "Get the sha and branch when a file was deleted"
    if not set -q argv[1]
        return 1
    end

    if not git_is_repo
        echo "Fatal: not a git repository"
        return 1
    end

    set -l sha_commit (command git log --format=%H --all --diff-filter=D -- $argv[1])
    set -l branch_name (command git branch -r --contains $sha_commit | sort --reverse | head -n1)
    set -l trim_branch_name (string trim $branch_name)

    if test -n "$sha_commit"
        echo "The file was deleted by the commit $sha_commit in the branch $trim_branch_name"
        return 0
    else
        if not test -f $argv[1]
            echo "File not found"
            return 2
        else
            echo "The file is not deleted still in the repository"
            return 3
        end
    end
end
