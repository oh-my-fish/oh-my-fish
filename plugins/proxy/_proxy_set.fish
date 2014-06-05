function _proxy_set -a proxy \
  -d "Set all proxy vars to specified value"

  set -l envars http_proxy ftp_proxy https_proxy all_proxy no_proxy \
    HTTP_PROXY HTTPS_PROXY FTP_PROXY NO_PROXY ALL_PROXY
  for envar in $envars
    if test $proxy = '-e'
      set -e $envar
    else
      set -gx $envar $proxy
    end
  end
end
