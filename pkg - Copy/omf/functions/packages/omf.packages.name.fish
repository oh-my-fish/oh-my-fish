function omf.packages.name -a name_or_url
  command basename $name_or_url | sed -E 's/^(omf-)?((plugin|pkg|theme)-)?//;s/.git$//'
end
