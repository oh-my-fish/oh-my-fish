#!/bin/sh
set -e
BINDIR=$HOME/fish/bin
# check to see if fish bin doesn't exist
if [ ! -x "$BINDIR/fish" ]; then
  cd /tmp
  wget -O - https://github.com/fish-shell/fish-shell/releases/download/2.2.0/fish-2.2.0.tar.gz | tar xzv
  cd fish-2.2.0 && ./configure --prefix=$HOME/fish && make -j2 && make install;
  strip $BINDIR/fish $BINDIR/fish_indent $BINDIR/mimedb
else
  echo 'Using cached directory.';
fi
