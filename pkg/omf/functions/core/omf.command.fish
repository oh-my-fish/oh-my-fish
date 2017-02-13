function omf.command -d 'Lookup OMF command by name or alias' -a name
  switch "$name"
    case 'cd'
      echo cd
    case 'channel'
      echo channel
    case 'd' 'describe'
      echo describe
    case 'destroy'
      echo destroy
    case 'doctor'
      echo doctor
    case 'help'
      echo help
    case 'i' 'in' 'install' 'get'
      echo install
    case 'l' 'ls' 'list'
      echo list
    case 'n' 'new'
      echo new
    case 'reload'
      echo reload
    case 'r' 'rm' 'remove' 'uninstall'
      echo remove
    case 'repo' 'repositories'
      echo repositories
    case 't' 'theme'
      echo theme
    case 'u' 'update'
      echo update
    case 's' 'search'
      echo search
    case 'version'
      echo version
    case '*'
      return $OMF_UNKNOWN_OPT
  end
end
