function omf.cli.list -a type
  test -z "$type"; and set type '--installed'

  if contains -- $type '--available' '-a' '--database' '-d' '--installed' '-i'
    omf.packages.list $type | column
  else
    echo (omf::err)"Invalid arguments"(omf::off)
    echo 'Usage: omf list [ --available | -a ]'
    echo '       omf list [ --installed | -i ]'
    echo '       omf list [ --database  | -d ]'
    return $OMF_INVALID_ARG
  end

end
