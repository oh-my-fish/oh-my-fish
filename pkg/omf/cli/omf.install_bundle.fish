function omf.install_bundle

  if test -f $OMF_CONFIG/bundle
    set packages (omf.list_local_packages)
    set themes (omf.list_installed_themes)

    for record in (cat $OMF_CONFIG/bundle)
      set type (echo $record | cut -d' ' -f1)
      set name (echo $record | cut -d' ' -f2- | sed -e 's/\.git//')

      switch $type
      case "package"
        if not contains (basename $name) $packages
          omf.install --pkg $name
        end

      case "theme"
        if not contains (basename $name) $themes
          omf.install --theme $name
        end
      end

    end
  end

  return 0
end
