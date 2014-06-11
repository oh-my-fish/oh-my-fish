function _proxy_set -a proxy \
  -d "Set all proxy vars to specified value"

  set -l envars http_proxy HTTP_PROXY \
    https_proxy HTTPS_PROXY \
    ftp_proxy FTP_PROXY \
    all_proxy ALL_PROXY
  for envar in $envars
    if test $proxy = '-e'
      set -e $envar
    else
      set -gx $envar $proxy
    end
  end
end
