function peco_select_history
  history|peco|read foo
  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
