function _update_gi_completions -d "Update completions for gitignore.io"
  set compl_dir ~/.config/fish/completions
  set compl_file "$compl_dir/gi.fish"

  # Download list of ignore types
  set -l gi_list (gi list | tr ',' ' ')
  if test -z $gi_list
    echo "No result returned from gitignore.io" >&2
    return 1
  end

  # Backup existing completions
  if test -e $compl_file
    mv -f $compl_file {$compl_file}.bak
  else if not test -d $compl_dir
    mkdir -p $compl_dir
  end

  # Output new completions
  echo complete -c gi -a \"update-completions $gi_list\" >$compl_file
end
