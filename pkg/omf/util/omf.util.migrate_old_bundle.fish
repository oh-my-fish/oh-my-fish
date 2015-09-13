function omf.util.migrate_old_bundle
  set OMF_OLD_CONFIG ~/.config/fish/config.fish
  set OLD_PLUGIN (grep "Plugin" $OMF_OLD_CONFIG 2> /dev/null)
  set OLD_THEMES (grep "Theme" $OMF_OLD_CONFIG 2> /dev/null)
  set BUNDLE_PATH $OMF_CONFIG/bundle

  if test -z "$OLD_PLUGIN" -a -z "$OLD_THEMES"
    return 0
  end

  for theme in $OLD_THEMES
    omf.bundle.add theme (echo $theme | sed -n 's/Theme "\(.*\)"/\1/p')
  end

  for plugin in $OLD_PLUGIN
    omf.bundle.add package (echo $plugin | sed -n 's/Plugin "\(.*\)"/\1/p')
  end

  sed -i '/Theme.*/d;/Plugin.*/d' $OMF_OLD_CONFIG

  return 0
end