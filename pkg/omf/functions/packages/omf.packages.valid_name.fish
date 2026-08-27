function omf.packages.valid_name -a package
  # Reserved names.
  contains -- (string lower -- "$package") omf default
    and return 10

  # A name is a single path component: it starts with a letter or digit and
  # contains only letters, digits, dots, underscores and dashes.
  string match -qr -- '^[A-Za-z0-9][A-Za-z0-9._-]*$' "$package"
    or return 10

  return 0
end
