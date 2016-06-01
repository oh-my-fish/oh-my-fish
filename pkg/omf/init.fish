set -g OMF_MISSING_ARG   1
set -g OMF_UNKNOWN_OPT   2
set -g OMF_INVALID_ARG   3
set -g OMF_UNKNOWN_ERR   4

function omf::em
  set_color $fish_color_match ^/dev/null; or set_color cyan
end

function omf::dim
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
end

function omf::err
  set_color $fish_color_error ^/dev/null; or set_color red --bold
end

function omf::under
  set_color --underline
end

function omf::off
  set_color normal
end

autoload $path/functions/{compat,core,packages,themes,bundle,util,repo,cli}
