function omf.query_env
  function __omf.print_pretty_path -a path
    printf "%s\n" $path   \
    | sed "s|$HOME|"(omf::em)"~"(omf::off)"|g" \
    | sed "s|/|"(omf::em)"/"(omf::off)"|g"
  end

  if not set -q argv[1]
    for var in (set)
      echo (omf::dim)(echo $var | awk '{ printf $1"\n"; }')(omf::off)
      echo (omf::em)(__omf.print_pretty_path (echo $var | awk '{$1=""; print $0}'))(omf::off)
    end
  else
    for key in $$argv[1]
      __omf.print_pretty_path $key
    end
  end
end
