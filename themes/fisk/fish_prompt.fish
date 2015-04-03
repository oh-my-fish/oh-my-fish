function fish_prompt --description 'Write out the prompt'
  set last_ret $status
  
  # Palette
  set -l base01 55f
  set -l base02 55a
  set -l base03 777
  
  set -l c_error f77
  set -l c_success 7f7
  
  set -l c_yellow ff5
  set -l c_magenta f0d
  
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_cwd
    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
  end

  if set -q VIRTUAL_ENV
    set venv (concat " " (set_color $c_magenta) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal))
  else
    set venv ""
  end

  set ret_color $c_success

  if test $last_ret -gt 0
    set ret_color $c_error
  end

  set -l ret_part (concat \
    (set_color $base03) '[' \
    (set_color $ret_color) $last_ret \
    (set_color $base03) ']' \
  )

  set -l user_part (concat \
    (set_color $base01) $USER \
    (set_color $base02) @ \
    (set_color $base01) $__fish_prompt_hostname \
  )

  # Virtualenv, git, &c.
  set -l context_part (concat \
    $__fish_prompt_cwd (prompt_pwd) $venv (set_color -o $c_yellow) (__fish_git_prompt) \
  )

  set -l prompt_end (concat (set_color $base01) '➞')

  echo -n (concat $ret_part " " $user_part " " $context_part " " $prompt_end (set_color normal) " ")
end
