function omf.bundle.install
  set bundle $OMF_CONFIG/bundle

  if test -f $bundle
    set packages (omf.packages.list --installed --plugin)
    set themes (omf.packages.list --installed --theme)
    set bundle_contents (cat $bundle | sort -u)

    for record in $bundle_contents
      set type (echo $record | cut -d' ' -f1)
      set name_or_url (echo $record | cut -d' ' -f2-)
      set name (basename $name_or_url | sed 's/\.git//;s/^pkg-//;s/^plugin-//;s/^theme-//')

      switch $type
      case "package"
        if not contains $name $packages
          omf.install --pkg $name_or_url
        end

      case "theme"
        if not contains $name $themes
          omf.install --theme $name_or_url
        end
      end
    end

    sort -u $bundle -o $bundle
  end

  return 0
end
