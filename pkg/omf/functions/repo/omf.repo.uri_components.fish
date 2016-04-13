function omf.repo.uri_components -a uri
  test -n "$uri"
    or return 1

  switch $uri
  case 'git@*'
    echo $uri | sed -r 's/git@([^:]+):([^/]+)\/([^.]+).*/\1 \2 \3/g'
  case 'http*://*'
    echo $uri | sed -r 's/https?:\/\/([^:/]+)(:\d+)?\/([^/]+)\/([^./]+).*/\1 \3 \4/g'
  case 'ftp*://*'
    echo $uri | sed -r 's/ftps?:\/\/([^:/]+)(:\d+)?\/([^/]+)\/([^./]+).*/\1 \3 \4/g'
  case 'ssh://*'
    echo $uri | sed -r 's/ssh:\/\/([^@]+@)?([^:/]+)(:\d+)?\/([^/]+)\/([^./]+).*/\2 \4 \5/g'
  case 'git://*'
    echo $uri | sed -r 's/git:\/\/([^:/]+)(:\d+)?\/([^/]+)\/([^./]+).*/\1 \3 \4/g'
  case '*@*'
    echo $uri | sed -r 's/([^@]+@)?([^:]+):([^/]+)\/([^./]+).*/\2 \3 \4/g'
  case '*'
    echo $uri
    return 1
  end
  return 0
end
