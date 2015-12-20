function omf.cli.install
  set fail_count 0

  switch (count $argv)
  case 0
    omf.bundle.install;
      or set fail_count 1
  case '*'
    for package in $argv
      omf.packages.install $package;
        and require $package

      test $status != 0;
        and set fail_count (math $fail_count + 1)
    end
  end

  return $fail_count
end
