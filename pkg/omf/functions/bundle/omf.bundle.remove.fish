function omf.bundle.remove
    set -l bundle $OMF_CONFIG/bundle

    if test -L $OMF_CONFIG/bundle
      set bundle (readlink $OMF_CONFIG/bundle)
    end

    if test -f $bundle
      set type $argv[1]
      set name $argv[2]
      set bundle_contents (cat $bundle | sort -u)

      rm -f $bundle

      for record in $bundle_contents
        set record_type (echo $record | cut -d' ' -f1)
        set record_name_or_url (echo $record | cut -d' ' -f2-)
        set record_name (omf.packages.name $record_name_or_url)

        if not test "$type" = "$record_type" -a "$name" = "$record_name"
          echo "$record_type $record_name_or_url" >> $bundle
        end
      end
    end

    return 0
  end
