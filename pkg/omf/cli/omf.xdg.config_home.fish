function omf.xdg.config_home -d "Return the config directory based on XDG specs"
  set -q XDG_CONFIG_HOME;
    and echo "$XDG_CONFIG_HOME";
    or echo "$HOME/.config"
end
