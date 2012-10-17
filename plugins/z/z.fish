function z
  cd (bash -c 'source /usr/local/etc/profile.d/z.sh; _z $0; echo $PWD' $argv)
end
