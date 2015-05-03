# name: scorphish

function _prompt_rubies -d 'Display current Ruby (rvm/rbenv)'
  [ "$theme_display_ruby" = 'no' ]; and return
  set -l ruby_version
  if type rvm-prompt >/dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type rbenv >/dev/null 2>&1
    set ruby_version (rbenv version-name)
    # Don't show global ruby version...
    [ "$ruby_version" = (rbenv global) ]; and echo -n -s '--'; and return
  end
  [ -z "$ruby_version" ]; and return

  echo -n -s $ruby_version
end

function _prompt_virtualfish -d "Display activated virtual environment (only for virtualfish, virtualenv's activate.fish changes prompt by itself)"
  [ "$theme_display_virtualenv" = 'no' -o -z "$VIRTUAL_ENV" ]; and echo -n -s '--'; and return
  echo -n -s (basename "$VIRTUAL_ENV")
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_dirty_remotes
  set current_branch (git rev-parse --abbrev-ref HEAD)
  set current_ref (git rev-parse HEAD)
  for remote in (git remote)
      # if test $remote != 'origin'
        set remote_ref_branch "refs/remotes/$remote/$current_branch"
        set remote_ref (git for-each-ref --format='%(objectname)' $remote_ref_branch)
        if test "$remote_ref" != ''
          if test "$remote_ref" != $current_ref
            echo !
          end
        end
      # end
  end
end


function fish_prompt
  set_color -o 666
  printf '['
  set_color -o blue
  printf '%s' (prompt_pwd)

  set_color -o 666
  printf '|'
  set_color -o red
  _prompt_rubies

  set_color -o 666
  printf '|'
  set_color -o green
  _prompt_virtualfish

  set_color -o 666
  echo ']'

  set -l gray (set_color 666)
  set -l cyan (set_color cyan)
  set -l red (set_color red)
  set -l normal (set_color normal)
  set -l yellow (set_color ffcc00)
  set -l green (set_color 80ff00)
  set -l pink (set_color ff99ff)
  set -l dark_pink (set_color cc99ff)

  # Show git branch and dirty state
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    set dirty_remotes (_git_dirty_remotes)

    if [ (_is_git_dirty) ]
      echo -n -s $gray '‹' $yellow $git_branch $red '*' $dirty_remotes $gray '›' $normal
    else
      echo -n -s $gray '‹' $yellow $git_branch $red $dirty_remotes $gray '›' $normal
    end
  end

  set_color 060
  printf ' »'
  set_color 090
  printf '»'
  set_color 0c0
  printf '»'
  set_color 0f0
  printf '» '

  set_color normal
end
