function init -a path --on-event init_omf
  autoload $path/cli $path/util
end

function omf::em
  set_color $fish_color_match ^/dev/null; or set_color cyan
end

function omf::dim
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
end

function omf::err
  set_color $fish_color_error ^/dev/null; or set_color red --bold
end

function omf::off
  set_color normal
end
