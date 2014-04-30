# Use python2 if found, otherwise fallback to python.
function _python
  if which python2
    python2 $argv
  else
    python $argv
  end
end
