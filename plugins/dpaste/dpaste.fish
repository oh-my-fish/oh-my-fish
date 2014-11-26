#!/usr/bin/env fish
# vim: ai ts=2 sw=2 et sts=2


# Just a dpaste (https://github.com/bartTC/dpaste) wrapper for fish-shell
# Roman Inflianskas (rominf) <infroma@gmail.com>
# Based on fish-sprunge plugin:
# Paul Joannon (paulloz) <paul.joannon@gmail.com>
# https://github.com/Paulloz/fish-sprunge
# Based on oh-my-zsh's sprunge plugin


set __dpaste_expires_choises '(onetime|1|twotimes|2|hour|week|month|never)'

function __dpaste_set_defaults
  set -g __dpaste_url_dpaste_de 'https://dpaste.de/api/?format=url'
  set -g __dpaste_keyword_dpaste_de 'content'
  set -g __dpaste_url_sprunge_us 'http://sprunge.us/'
  set -g __dpaste_keyword_sprunge_us 'sprunge'

  set -q dpaste_site; or set -g dpaste_site 'dpaste.de'
  set suffix (echo $dpaste_site | sed "s/\./_/g")

  set -g __dpaste_keyword (eval 'echo $__dpaste_keyword_'$suffix)
  set -q __dpaste_keyword; or set -g __dpaste_keyword $__dpaste_keyword_dpaste_de
  set -g __dpaste_send_url (eval 'echo $__dpaste_url_'$suffix)
  set -q __dpaste_send_url; or set -g __dpaste_send_url $__dpaste_url_dpaste_de
  set -g __dpaste_eat_once 0
end

function __dpaste_send
  function curl
    command curl --silent $argv
  end

  curl -F "$__dpaste_keyword=<-" $__dpaste_send_url | read -l url
  if [ $__dpaste_eat_once = 1 ]
    curl $url >/dev/null
  end
  echo $url
end

function __dpaste_parse_expires
  set expires_spec "-t $__dpaste_expires_choises"
  set expires (echo $argv | sed -E "s/.*$expires_spec.*/\1/")
  if [ -z (echo $expires | sed -E "s/$__dpaste_expires_choises//") ]
    echo $expires | grep -qE '(onetime|1)'; set -g __dpaste_eat_once (and echo 1; or echo 0)
    set expires (echo $expires | sed -E 's/(1|2|twotimes)/onetime/;s/hour/3600/;s/week/604800/;s/month/2592000/')
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
  -t EXPIRES  set snippet expiration time: $__dpaste_expires_choises [default: month]

Configuration:
  You can use this plugin with other dpaste instances.
  If you have a dpaste instance on 'example.com' just insert those lines
  into your config.fish file:
    set __dpaste_url_example_com 'https://example.com/api/?format=url'
    set dpaste_site 'example.com'

  You can even use this plugin with sprunge.us.
  Note, that sprunge.us doesn't support '-t' option.
    set dpaste_site 'sprunge.us'"
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
