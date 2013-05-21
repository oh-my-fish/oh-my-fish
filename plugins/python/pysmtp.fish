# start smtp debugging server, can pass an option port parameter. Default to 1025
function pysmtp
  if test -n "$argv"
    set SMTPPORT $argv
  else
    set SMTPPORT 1025
  end
  echo "smtp server started on port" $SMTPPORT;
  python -m smtpd -n -c DebuggingServer localhost:$SMTPPORT;
end
