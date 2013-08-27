# name: Cor
# Display the following bits on the left:
# * Virtualenv name (if applicable, see https://github.com/adambrenecki/virtualfish)
# * Current user
# * Current compressed directory name
# * return status if not 0

function fish_prompt
  set -l last_status $status
  set -l yellow (set_color ffff33)
  set -l dark_yellow (set_color ffb266)
  set -l red (set_color red)
  set -l green (set_color 80ff00)
  set -l normal (set_color normal)
  set -l dark_green (set_color 006600)

  set -l cwd $cyan(basename (prompt_pwd))
  
  # Prompt
  set -l prompt
  if [ "$UID" = "0" ]
    set prompt "$red# "
  else
    set prompt "$normal% "
  end

  # output the prompt, left to right

  # Add a newline before prompts
  #echo -e ""

  # Display [venvname] if in a virtualenv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b cyan black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
  end
  if test $last_status -ne 0
    set ret_status $red $last_status '↵' $normal
  end

  # Display the current directory name
  echo -n -s $green (whoami) $dark_green @ $green (hostname|cut -d . -f 1) $dark_green › $yellow (prompt_pwd) $ret_status $dark_yellow (emoji-clock) ' ⁑' $normal
  #echo -n -s $green (whoami) $dark_green @ $green (hostname|cut -d . -f 1) $dark_green › $yellow (prompt_pwd) $ret_status $dark_yellow ⁑ $normal

  # Terminate with a nice prompt char
  echo -n -s ' ' $normal

end
