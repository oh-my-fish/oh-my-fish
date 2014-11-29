## ssh conservative $TERM value helper

Due to inconsistency of 256 color terminal support across
terminal applications, it may be desirable to force the
$TERM value to it's -256color variant.

For example, this is often accomplished in tmux by means
of adding the following to a tmux.conf file:

    set -g default-terminal "screen-256color"

Unfortunately, remote hosts accessed via ssh may not have
the requisite terminfo files, and may not even allow the
user to supply them, as is often the case with network
equipment and other appliances accessible via ssh.

This helper strips the -256color suffix and exports a
regular 'screen' or 'xterm' $TERM value when setting up
a ssh connection.

