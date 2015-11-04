function __omf.destroy.restore_backup -a file_path
  set -l path (dirname $file_path)
  set -l file (basename $file_path)
  set -l name (echo $file | cut -d. -f1)
  set -l backup_file_path (echo $path/$name.*.copy | tr ' ' '\n' | sort -r | head -1)

  if test -e "$backup_file_path"
    mv "$backup_file_path" "$path/$file" ^/dev/null
  else
    rm -f "$path/$file" ^/dev/null
  end
end

function omf.destroy -d "Remove Oh My Fish"
  echo (omf::dim)"Removing Oh My Fish..."(omf::off)

  for pkg in (basename -a $OMF_PATH/pkg/*)
    emit uninstall_$pkg
  end

  set -q XDG_CONFIG_HOME;
    or set -l XDG_CONFIG_HOME "$HOME/.config"

  set -l fish_config_home $XDG_CONFIG_HOME/fish
  set -l fish_prompt_home $fish_config_home/functions

  __omf.destroy.restore_backup "$fish_config_home/config.fish"
  __omf.destroy.restore_backup "$fish_prompt_home/fish_prompt.fish"

  if test "$OMF_PATH" != "$HOME"
    rm -rf "$OMF_PATH"
  end

  set -q CI; or exec fish < /dev/tty
end
