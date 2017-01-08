function omf.cli.describe -a package -d 'Show information about a package'
  if set -l props (omf.index.stat $package description repository maintainer)
    echo "Package: $package"
    echo "Description: $props[1]"
    echo "Repository: $props[2]"
    echo "Maintainer: $props[3]"

    return 0
  end

  echo "Unable to locate package '$package'." >&2
  return 1
end
