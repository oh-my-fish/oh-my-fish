# start in-place a simple http server, take a optional parameter for the port number
function pyhttp
  if test -n "$argv"
    set HTTPPORT $argv
  else
    set HTTPPORT 1025
  end

  _python -m SimpleHTTPServer $HTTPPORT;
end
