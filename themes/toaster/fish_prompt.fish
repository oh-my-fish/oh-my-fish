set __toaster_color_orange FD971F
set __toaster_color_blue 6EC9DD
set __toaster_color_green A6E22E
set __toaster_color_yellow E6DB7E
set __toaster_color_pink F92672
set __toaster_color_grey 554F48
set __toaster_color_white F1F1F1
set __toaster_color_purple 9458FF
set __toaster_color_lilac AE81FF

function __toaster_color_echo
  set_color $argv[1]
  echo -n $argv[2]
end

function __toaster_current_folder
  echo -n $PWD | grep -o -E '[^\/]+$'
end

function __toaster_git_status_codes
  echo (git status --porcelain ^/dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n')
end

function __toaster_git_branch_name
  echo (git rev-parse --abbrev-ref HEAD ^/dev/null)
end

function __toaster_rainbow
  if echo $argv[1] | grep -q -e $argv[3]
    __toaster_color_echo $argv[2] "彡ミ"
  end
end

function __toaster_git_status_icons
  set -l git_status (__toaster_git_status_codes)

  __toaster_rainbow $git_status $__toaster_color_pink 'D'
  __toaster_rainbow $git_status $__toaster_color_orange 'R'
  __toaster_rainbow $git_status $__toaster_color_white 'C'
  __toaster_rainbow $git_status $__toaster_color_green 'A'
  __toaster_rainbow $git_status $__toaster_color_blue 'U'
  __toaster_rainbow $git_status $__toaster_color_lilac 'M'
  __toaster_rainbow $git_status $__toaster_color_grey '?'
end

function __toaster_git_status
  # In git
  if test -n (__toaster_git_branch_name)

    __toaster_color_echo $__toaster_color_blue " git"
    __toaster_color_echo $__toaster_color_white ":"(__toaster_git_branch_name)

    if test -n (__toaster_git_status_codes)
      __toaster_color_echo $__toaster_color_pink ' ●'
      __toaster_color_echo $__toaster_color_white ' [^._.^]ﾉ'
      __toaster_git_status_icons
    else
      __toaster_color_echo $__toaster_color_green ' ○'
    end
  end
end

function fish_prompt
  __toaster_color_echo $__toaster_color_blue "# "
  __toaster_color_echo $__toaster_color_purple (__toaster_current_folder)
  __toaster_git_status
  echo
  __toaster_color_echo $__toaster_color_pink "\$ "
end
