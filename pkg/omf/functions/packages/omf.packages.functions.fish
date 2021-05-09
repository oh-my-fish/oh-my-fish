function omf.packages.functions -a pkg_name -d 'List functions provided by package'
  set -l fun_path (omf.packages.path $pkg_name)
  if not string length -q $fun_path
    echo "Could not find package $pkg_name"
    return 1
  end
  set -l files (find $fun_path -name "*.fish")
  echo "Functions for $pkg_name:"
  for file in $files
    set -l fun_lines (grep "^\s*function" $file)
    for f in $fun_lines
      set -l fun_name (echo $f | sed -n 's/^\s*function \(\S\+\).*/\1/p')
      set -l fun_desc (echo $f | sed -n 's/.*function.*-d ["\']\([^"\']\+\)["\'].*/\1/p')
      if string length -q $fun_desc
        echo \t"$fun_name: $fun_desc"
      else
        echo \t"$fun_name"
      end
    end
  end
  return 0
end
