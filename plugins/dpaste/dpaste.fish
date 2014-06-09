# Just a dpaste (https://github.com/bartTC/dpaste) wrapper for fish-shell
# Roman Inflianskas (rominf) <infroma@gmail.com>
# Based on fish-sprunge plugin:
# Paul Joannon (paulloz) <paul.joannon@gmail.com>
# https://github.com/Paulloz/fish-sprunge
# Based on oh-my-zsh's sprunge plugin


set dpaste_expires_choises '(onetime|never|hour|week|month)'

function dpaste_set_defaults
  if [ -z $dpaste_keyword ]
    set -g dpaste_keyword content
  end
  if [ -z $dpaste_url ]
    set -g dpaste_url 'https://dpaste.de/api/?format=url'
  end
end

function dpaste_send
  # echo $dpaste_url >&2
  # echo $dpaste_send_url >&2
  curl -F "$dpaste_keyword=<-" $dpaste_send_url
end

function dpaste_parse_expires
  set expires_spec "-t $dpaste_expires_choises"
  set dpaste_expires (echo $argv | sed -r "s/.*$expires_spec.*/\1/" | sed 's/hour/3600/' | sed 's/week/604800/' | sed 's/month/2592000/')
  if [ -z (echo $dpaste_expires | sed -r "s/$dpaste_expires_choises//") ]
    set dpaste_send_url "$dpaste_send_url&expires=$dpaste_expires"
  end
  echo $argv | sed -r "s/$expires_spec//"
end

function dpaste_help
  echo -e \
"Usage:
  dpaste [-t EXPIRES] < README.md
  dpaste [-t EXPIRES] README.md
  cat README.md | dpaste [-t EXPIRES]
  dpaste [-t EXPIRES] "I \<3 to paste"

Options:
  -t EXPIRES  set snippet expiration time: $dpaste_expires_choises [default: month]"
end

function dpaste_parse_help
  if contains -- -h $argv
    dpaste_help
  end
end

function dpaste
  dpaste_set_defaults
  set -g dpaste_send_url $dpaste_url
  dpaste_parse_help $argv
  or begin
    set argv (dpaste_parse_expires $argv)
    if isatty
      if [ -n $argv ]
        if [ -f $argv ]
          cat $argv
        else
          echo $argv
        end | dpaste_send
      else
        dpaste_help
      end
    else
      dpaste_send
    end
  end
end
