function z
  cd (bash -c 'source $Z_SCRIPT_PATH; _z $0; echo $PWD' $argv)
end
