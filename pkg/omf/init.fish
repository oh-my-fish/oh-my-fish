set -g OMF_MISSING_ARG   1
set -g OMF_UNKNOWN_OPT   2
set -g OMF_INVALID_ARG   3
set -g OMF_UNKNOWN_ERR   4

function omf::em
  set_color cyan 2> /dev/null
end

function omf::dim
  set_color 555 2> /dev/null
end

function omf::err
  set_color red --bold 2> /dev/null
end

function omf::under
  set_color --underline 2> /dev/null
end

function omf::off
  set_color normal 2> /dev/null
end

autoload $path/functions/{compat,core,index,packages,themes,bundle,util,repo,cli,search}
