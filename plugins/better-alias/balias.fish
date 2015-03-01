function balias --argument alias command
  eval 'alias $alias $command'
  if expr $command : '^sudo '>/dev/null
    set command (echo "$command" | cut -c6-)
  end
  complete -c $alias -xa "(
    set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
    complete -C\"$command \$cmd\";
  )"
end
