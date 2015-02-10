# NAME
#   tiny - tap into github's git.io URL shortener
#
# SYNOPSIS
#   tiny [-u --user <username>]
#        [-r --repo <repository>]
#        [-c --code <vanity code>]
#        [-o --open]
#        [-h --help]
#
#   tiny [-c --code] [-o --open] owned-repo/url
#
# DESCRIPTION
#   Tap into git.io, github's URL shortener service, to easily shorten any
#   github URL. The generated URL is printed to `stdout` and copied to the
#   clipboard. You can optionally specify the `-o` flag to open it up on
#   your browser too.
#
# OPTIONS
#   -u --user  Username. If omitted, query the git global config.
#   -r --repo  Repository.
#   -c --code  Own code to setup a personal `vanity` URL. A regular short
#              URL is generated if the specified code is not available.
#   -o --open  Open the short URL in the browser.
#   -h --help  Display usage help.
#
# DEFAULT OPTIONS
#   It's possible to omit the `-u` option and just specify the `url` to
#   shorten.
#
#     tiny my-awesome-repo
#
#   In this case, the username will be retrieved from your git config.
#   You can add your github username to git's config like this:
#
#     git config github.user <your username>
#
#   Another common use case is to simply copy paste an existing URL into
#   the terminal:
#
#     tiny [-o --open] http://github.com/facebook/react
#
# DIAGNOSTICS
#   The following error codes are generated:
#     1  git.io failed to shorten the URL
#     2  invalid input or no input
#
# LINKS
#   github.com/blog/985-git-io-github-url-shortener
# /

import plugins/getopts

function github.io -a url code
  if test -n "$code"
    set code -F code=$code
  end
  # Extract URL from the response an remove an annoying \r at the end.
  curl -is http://git.io/ -F url="$url" $code \
    | grep "Location: http" | cut -c11- \
    | awk '{print substr($0, 1, length($0) - 1)}'
end

function tiny -d "get a git.io short URL"
  set -l __github_url         "https://github.com"
  set -l __github_user        (git config github.user)

  set -l __TINY_ERR_BAD_URL   1
  set -l __TINY_ERR_BAD_INPUT 2

  while set opts (getopts ":o:open u:user: r:repo: c:code: h:help" $argv)
    switch $opts[1]
      case o
        set open true
      case u
        set user $opts[2]
      case r
        set repo $opts[2]
      case c
        set code $opts[2]
      case h
        tiny.help
    end
  end

  test $status -gt 1
    and tiny.help
    and return $__TINY_ERR_BAD_INPUT

  if echo "$opts" | grep --silent "http"
    set url "$opts"
  else if test -n "$opts"
    # To allow the covenience of `tiny [OPTS] repo` → `tiny [OPTS] -r repo`
    set repo "$opts"
  end

  if not set -q url
    if not set -q user
      if not set -q repo
        tiny.help
        return $__TINY_ERR_BAD_INPUT
      end

      set user $__github_user
      if test -z "$user"
        echo "Specify a username via the -u option or save it to your git config."
        echo -sn (set_color ccc) "e.g., git config --global github.user"
        echo (set_color yellow) "username"
        return $__TINY_ERR_BAD_INPUT
      end
    end

    set url "$__github_url/$user/$repo" "$code"
  end

  set url (github.io $url)
  if test -n "$url"
    if test (uname) != "Darwin"
      import plugins/pbcopy
    end
    # Print to stdout, copy to stderr pipe it into pbcopy.
    echo "$url" | tee /dev/stderr ^| pbcopy ^/dev/null

    set -q open
      and open "$url"
      or true
  else
    return $__TINY_ERR_BAD_URL
  end
end
