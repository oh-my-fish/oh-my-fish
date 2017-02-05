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
      if contains -- $package (omf.packages.list --theme)
        omf.theme.set $package
      end

      test $status != 0;
        and set fail_count (math $fail_count + 1)
    end
  end

  return $fail_count
end
