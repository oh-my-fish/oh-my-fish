proxy plugin
============

The proxy plugin provides a couple helper functions to those of us who are
stuck behind HTTP/HTTPS/FTP proxies that require authentication.

## Usage

In all cases you will need to add 'proxy' to your fish_plugins list in
config.fish

### No authentication

If you just want to have the proxy plugin configure all the environment
variables, you may set proxy_host:

    set proxy_host myproxy.example.com:8000

The proxy plugin will prepend `http://` for you.  Here's the result:

    ~> set -x |grep proxy
    ALL_PROXY http://myproxy.example.com:8000
    FTP_PROXY http://myproxy.example.com:8000
    HTTPS_PROXY http://myproxy.example.com:8000
    HTTP_PROXY http://myproxy.example.com:8000
    NO_PROXY http://myproxy.example.com:8000
    all_proxy http://myproxy.example.com:8000
    ftp_proxy http://myproxy.example.com:8000
    http_proxy http://myproxy.example.com:8000
    https_proxy http://myproxy.example.com:8000
    no_proxy http://myproxy.example.com:8000

### With authentication

Set your proxy host and username:

    set proxy_host myproxy.example.com:8000
    set proxy_user mylogin

When you need to make use of the proxy, just run `proxy`.  It will prompt you
for a password and setup your environment.

If you didn't setup a proxy_user variable, you will be prompted for a username.

If you wish to clear your proxy variables, run `noproxy`.
