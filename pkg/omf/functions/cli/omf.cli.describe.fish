function omf.cli.describe -a package -d 'Show information about a package'
  if set -l props (omf.db.info $package description repository)
    echo "Package: $package"
    echo "Description: $props[1]"
    echo "Repository: $props[2]"

    return 0
  end

  return 1
end
