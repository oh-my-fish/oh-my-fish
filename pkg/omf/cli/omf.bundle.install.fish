function omf.bundle.install
  set bundle $OMF_CONFIG/bundle

  if test -f $bundle
    set packages (omf.list_local_packages)
    set themes (omf.list_installed_themes)
    set bundle_contents (cat $bundle | sort -u)

    for record in $bundle_contents
      set type (echo $record | cut -d' ' -f1)
      set name_or_url (echo $record | cut -d' ' -f2-)
      set name (basename $name_or_url | sed 's/\.git//;s/^pkg-//;s/^plugin-//;s/^theme-//')

      switch $type
      case "package"
        if not contains $name $packages
          omf.install --pkg $name
        end

      case "theme"
        if not contains $name $themes
          omf.install --theme $name
        end
      end
    end
  end

  return 0
end
