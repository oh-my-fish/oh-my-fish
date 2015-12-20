function omf.cli.submit
  switch (count $argv)
  case 2
    omf.packages.submit $argv
  case "*"
    echo (omf::err)"Argument missing"(omf::off) 1^&2
    echo "Usage: $_ "(omf::em)"submit"(omf::off)" "(omf::em)"pkg|themes"(omf::off)"/<name> <url>" 1^&2
    return $OMF_MISSING_ARG
  end
end
