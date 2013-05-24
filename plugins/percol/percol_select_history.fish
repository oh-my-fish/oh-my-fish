function percol_select_history
  history|percol|read foo
  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
