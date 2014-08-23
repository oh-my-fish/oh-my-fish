function balias --argument alias command
  eval 'alias $alias $command'
  if expr match $command '^sudo '>/dev/null
    set command (expr substr + $command 6 (expr length $command))
  end
  complete -c $alias -xa "(
    set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
    complete -C\"$command \$cmd\";
  )"
end

