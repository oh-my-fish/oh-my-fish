function omf.util_mkdir -a name
  set -l name "$argv[1]"
  if test -d "$OMF_CONFIG"
    set name "$OMF_CONFIG/$name"
  else if test -d "$OMF_PATH"
    set name "$OMF_PATH/$name"
  end
  mkdir -p "$name"
  echo $name
end
