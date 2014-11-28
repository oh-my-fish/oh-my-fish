# composer command
function composer
  if test -e ./composer.phar # if there is composer in this path use local one
    ./composer.phar $argv;
  else if test -n "$COMPOSER_BIN"
    eval "$COMPOSER_BIN" $argv;
  else
    echo "Please install composer.phar to your PATH. Or use \"composer_install\" to install Composer to current directory."
  end
end
