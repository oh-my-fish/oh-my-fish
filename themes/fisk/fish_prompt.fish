function fish_prompt --description 'Write out the prompt'
  set last_ret $status
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_cwd
    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
  end

  if set -q VIRTUAL_ENV
    set venv (echo -n -s " " (set_color ff00de) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal))
  else
    set venv ""
  end

  git branch >  /dev/null ^ /dev/null
  if [ $status = 0 ]
    set branch (concat (set_color -o blue) "(" (basename (git rev-parse --show-toplevel)) ")")
  else
    set branch ""
  end

  set ret_color 7f7

  if [ $last_ret -gt 0 ]
    set ret_color f77
  end

  set -l ret_part (concat \
    (set_color 777) '[' \
    (set_color $ret_color) $last_ret \
    (set_color 777) ']' \
  )

  set -l user_part (concat \
    (set_color 55f) $USER \
    (set_color 55a) @ \
    (set_color 55f) $__fish_prompt_hostname \
  )

  set -l _context_part (concat \
    "$__fish_prompt_cwd" (prompt_pwd) "$venv" (set_color -o yellow) (__fish_git_prompt) \
  )

  set -l prompt_end (concat (set_color 55f) '➞')

  echo -n (concat $ret_part " " $user_part " " $_context_part " " $prompt_end (set_color normal) " ")
end
