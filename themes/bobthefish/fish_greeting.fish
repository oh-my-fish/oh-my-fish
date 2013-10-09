function fish_greeting
  set_color $fish_color_autosuggestion[1]
  uname -npsr
  uptime
  set_color normal
end
