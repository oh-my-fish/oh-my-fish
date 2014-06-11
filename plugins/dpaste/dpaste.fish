# Just a dpaste (https://github.com/bartTC/dpaste) wrapper for fish-shell
# Roman Inflianskas (rominf) <infroma@gmail.com>
# Based on fish-sprunge plugin:
# Paul Joannon (paulloz) <paul.joannon@gmail.com>
# https://github.com/Paulloz/fish-sprunge
# Based on oh-my-zsh's sprunge plugin


set __dpaste_expires_choises '(onetime|never|hour|week|month)'

function __dpaste_set_defaults
  if [ -z $dpaste_keyword ]
    set -g dpaste_keyword 'content'
  end
  if [ -z $dpaste_url ]
    set -g dpaste_url 'https://dpaste.de/api/?format=url'
  end
  set -g __dpaste_send_url $dpaste_url
end

function __dpaste_send
  curl -F "$dpaste_keyword=<-" $__dpaste_send_url
end

function __dpaste_parse_expires
  set expires_spec "-t $__dpaste_expires_choises"
  set expires (echo $argv | sed -E "s/.*$expires_spec.*/\1/")
  if [ -z (echo $expires | sed -E "s/$__dpaste_expires_choises//") ]
    set expires (echo $expires | sed 's/hour/3600/' | sed 's/week/604800/' | sed 's/month/2592000/')
    set __dpaste_send_url "$__dpaste_send_url&expires=$expires"
  end
  echo $argv | sed -E "s/$expires_spec//" | xargs
end

function __dpaste_help
  echo -e \
"Usage:
  dpaste [-t EXPIRES] < README.md
  dpaste [-t EXPIRES] README.md
  cat README.md | dpaste [-t EXPIRES]
  dpaste [-t EXPIRES] \"I \<3 to paste\"

Options:
  -t EXPIRES  set snippet expiration time: $__dpaste_expires_choises [default: month]"
end

function __dpaste_parse_help
  begin
    contains -- -h $argv
	or contains -- --help $argv
  end
  and __dpaste_help
end

function dpaste
  __dpaste_set_defaults
  __dpaste_parse_help $argv
  or begin
    set argv (__dpaste_parse_expires $argv)
    if isatty
      if [ -n $argv ]
        if [ -f $argv ]
          cat $argv
        else
          echo $argv
        end | __dpaste_send
      else
        __dpaste_help
      end
    else
      __dpaste_send
    end
  end
end
