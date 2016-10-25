set -g OMF_MISSING_ARG   1
set -g OMF_UNKNOWN_OPT   2
set -g OMF_INVALID_ARG   3
set -g OMF_UNKNOWN_ERR   4

function omf::em
  set_color cyan ^ /dev/null
end

function omf::dim
  set_color 555 ^ /dev/null
end

function omf::err
  set_color red --bold ^ /dev/null
end

function omf::under
  set_color --underline ^ /dev/null
end

function omf::off
  set_color normal ^ /dev/null
end

autoload $path/functions/{compat,core,index,packages,themes,bundle,util,repo,cli,search}
