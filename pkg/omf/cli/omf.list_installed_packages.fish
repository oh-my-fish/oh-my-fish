# Backwards-compatible wrapper function
# TODO: Remove it after 2015, December 13
function omf.list_installed_packages
  omf.packages.list --installed --plugin
end
