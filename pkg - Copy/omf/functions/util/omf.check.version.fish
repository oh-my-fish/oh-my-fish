function omf.check.version -a min_version -a current_version
  test (echo "$min_version"\n"$current_version" | tr '.' ' ' | sort -n | head -n1) = (echo "$min_version" | tr '.' ' ')
end
