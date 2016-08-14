function hg_branch_or_bookmark_name -d "Get current branch / bookmark name" -a repo_root
  command cat $repo_root'/.hg/bookmarks.current' ^/dev/null;
    or command cat $repo_root'/.hg/branch'
end
