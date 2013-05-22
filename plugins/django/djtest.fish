# time, cleanup pyc and running test, settings as first argument
# e.g. djtest settings_dev
function djtest
  set VERBOSE --verbosity=1
  find . -name "*.pyc" -delete

  if set -q argv
    time python manage.py test $VERBOSE --settings=$argv
  else
    time python manage.py test $VERBOSE
  end

end
