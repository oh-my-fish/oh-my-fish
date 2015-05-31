function Plugin --argument-names name
  set -g fish_plugins $fish_plugins $name

  if [ -e $fish_path/plugins/$name -o -e $fish_custom/plugins/$name ]
    import plugins/$name
  else
    set_color red
    echo "Plugin '$name' is not installed. Run 'omf install' to download and install it."
    set_color normal
  end
end
