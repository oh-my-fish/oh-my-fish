# name: CoffeeAndCode
# Theme colors
set fish_color_normal 5f5f5f
set fish_color_command 5f87ff
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_end bcbcbc
set fish_color_error red --bold
set fish_color_param 5f87ff
set fish_color_comment red
set fish_color_match cyan
set fish_color_search_match --background=purple
set fish_color_operator cyan
set fish_color_escape cyan
set fish_color_cwd 00875f
set fish_pager_color_prefix cyan
set fish_pager_color_completion normal
set fish_pager_color_description 555 yellow
set fish_pager_color_progress cyan
set fish_pager_color_secondary

set fish_color_host cyan
set fish_color_user cyan

# Git prompt setup
set __fish_git_prompt_char_untrackedfiles '*'
set __fish_git_prompt_color yellow
set __fish_git_prompt_color_stashstate red --bold
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_showstashstate true
set __fish_git_prompt_showuntrackedfiles true


function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  function prompt_pwd
    echo $PWD | sed -e "s|^$HOME|~|"
  end

  if not set -q -g __fish_classic_git_functions_defined

    set -g __fish_classic_git_functions_defined

    function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
      if status --is-interactive
        set -e __fish_prompt_user
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
      if status --is-interactive
        set -e __fish_prompt_host
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
      if status --is-interactive
        set -e __fish_prompt_status
        commandline -f repaint ^/dev/null
      end
    end
  end

  set -l delim '$'

  switch $USER

  case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

  case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end

  echo -s "$__fish_prompt_user" "$USER" @ "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd)
  echo -s (__fish_git_prompt) "$__fish_prompt_normal" "$delim" ' '
end
