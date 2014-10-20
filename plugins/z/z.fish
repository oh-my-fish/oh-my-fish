function z
  cd (bash -c "source $Z_SCRIPT_PATH; _z $argv; echo \$PWD")
end
