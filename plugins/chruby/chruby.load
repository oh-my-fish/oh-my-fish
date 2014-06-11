#
# Depends on `chruby-fish` (https://github.com/JeanMertz/chruby-fish)
#
# set `CHRUBY_AUTO_ENABLED` to `false` to disable auto loading Ruby versions on
# directory change.
#
# set `CHRUBY_ROOT` to point to the root path of chruby. The path will be
# appended by `share/chruby/chruby.fish` and `share/chruby/auto.fish`.
#
set -q CHRUBY_ROOT; or set CHRUBY_ROOT /usr/local

if test -f "$CHRUBY_ROOT/share/chruby/chruby.fish"
  . "$CHRUBY_ROOT/share/chruby/chruby.fish"
else
  echo '`chruby` plugin loaded but chruby-fish not installed.' \
       'See: https://github.com/JeanMertz/chruby-fish'
end

if test "$CHRUBY_AUTO_ENABLED" != "false" -a \
        -f "$CHRUBY_ROOT/share/chruby/auto.fish"

  . "$CHRUBY_ROOT/share/chruby/auto.fish"
end
