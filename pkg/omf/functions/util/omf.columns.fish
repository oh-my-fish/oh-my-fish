# Lay stdin out in columns like `column`, or pass it through unchanged when
# `column` (util-linux) is not installed, e.g. on Alpine.
function omf.columns
  if type -q column
    command column
  else
    command cat
  end
end
