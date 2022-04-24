function omf.cli.install
  set fail_count 0

  omf.index.update
    or return 1

  switch (count $argv)
  case 0
    omf.bundle.install;
      or set fail_count 1
  case '*'
    for package in $argv
      omf.packages.install $package;
        and require $package

      # If package is a theme, set it to active.
      set -l themes (omf.packages.list --theme)
      if contains -- $package $themes
        omf.theme.set $package
      else if set -l ind (contains -i -- (omf.packages.name $package) $themes)
        omf.theme.set $themes[$ind]
      end

      test $status != 0;
        and set fail_count (math $fail_count + 1)
    end
  end

  return $fail_count
end
