# name: perry
# Works best in a black or dark terminal background.
# https://github.com/perryh/oh-my-fish
# Mostly copied from: https://github.com/godfat/fish_prompt-gitstatus

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_status_symbol
  set -l git_status (git status --porcelain ^/dev/null)
  if test -n "$git_status"
    # Is there anyway to preserve newlines so we can reuse $git_status?
    if git status --porcelain ^/dev/null | grep '^.[^ ]' >/dev/null
      echo '*' # dirty
    else
      echo '#' # all staged
    end
  else
    echo    '' # clean
  end
end

function _remote_hostname
  set -l red (set_color -o red)
  set -l white (set_color -o white)

  echo $white(whoami)$red@$white(hostname)
end

function fish_prompt
  set -l red (set_color -o red)
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)
  set -l git_status (_git_status_symbol)(_git_branch_name)

  if test -n "$git_status"
    set git_status " $git_status"
  end

  echo -n (_remote_hostname)$red':'$cyan$cwd$yellow$git_status$red'➜ '
end
