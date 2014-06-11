function proxy -d "Setup proxy environment variables"
  if not set -q proxy_host
    echo "Error: You must set proxy_host to your proxy hostname:port in config.fish"
    echo "You may also set proxy_user to your username"
    return
  end

  # Get user & password
  set -l user $proxy_user
  if not set -q proxy_user
    read -p "echo -n 'Proxy User: '" user
  end
  # Hacky way to read password in fish
  echo -n 'Proxy Password: '
  stty -echo
  head -n 1 | read -l pass
  stty echo
  echo
  # URL encode password
  set -l chars (echo $pass | sed -E -e 's/./\n\\0/g;/^$/d;s/\n//')
  printf '%%%02x' "'"$chars"'" | read -l encpass

  _proxy_set "http://$user:$encpass@$proxy_host"
end

