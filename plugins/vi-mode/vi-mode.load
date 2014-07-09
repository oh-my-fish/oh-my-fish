set_color normal

# vi:noexpandtab:sw=4:ts=4
#
# vi-mode for fish
# author: Ian Munsie
# Adapted for oh-my-fish by Sylvain Benner
#
# Requirements: fish 2.0+

# I'm thinking about changing these to separate out the colours from the text.
# I'm undecided on this though - when I support count arguments there may be
# some benefit from displaying the count here, but that would also make the
# size of these strings vary, which I'd rather not do...
set -l cn (set_color normal 2>/dev/null)
set -g vi_mode_normal  (set_color blue 2>/dev/null)'n'$cn
set -g vi_mode_replace (set_color red 2>/dev/null)'r'$cn
set -g vi_mode_REPLACE (set_color --background=red 2>/dev/null)'R'$cn
set -g vi_mode_insert  (set_color green 2>/dev/null)'i'$cn
set -g vi_mode_delete  (set_color red 2>/dev/null)'d'$cn
set -g vi_mode_change  (set_color yellow 2>/dev/null)'c'$cn
set -g vi_mode_g       (set_color blue 2>/dev/null)'g'$cn
set -g vi_mode_lower   (set_color blue 2>/dev/null)'u'$cn
set -g vi_mode_upper   (set_color blue 2>/dev/null)'U'$cn
set -g vi_mode_swapcase (set_color blue 2>/dev/null)'~'$cn

set -g __vi_mode_undo_cmdline ''
set -g __vi_mode_undo_cmdline_pos 0

# default vi mode
if test -z $vi_mode_default
    set -g vi_mode_default vi_mode_insert
end

# additional user key bindings go in vi_mode_user_key_bindings
function __vi_mode_user_key_bindings
    if functions | grep "vi_mode_user_key_bindings" > /dev/null
        vi_mode_user_key_bindings
    end
end

function __vi_mode_direction_command
    # commandline should always be last
    set ret (python (dirname (status -f))/vi-mode-impl.py $argv[1] $argv[2] (commandline -C) (commandline -L) (commandline))
    set new_pos $ret[-1]
    set -e ret[-1] # Guessing that deleting last element is likely to be faster than deleting first
    if test (count $ret) -gt 0
        commandline -- $ret
    end
    commandline -C $new_pos
end

function __vi_mode_common_emacs -d "common key bindings for all vi-like modes that are identical to the emacs mode"
    # Feel free to expand this list for anything that makes sense, this is just
    # a couple of hand-picked ones that seemed useful and/or I use :)

    bind \e\[A up-or-search
    bind \e\[B down-or-search
    bind -k down down-or-search
    bind -k up up-or-search

    bind \e\[C forward-char
    bind \e\[D backward-char
    bind -k right forward-char
    bind -k left backward-char

    bind \e\[H beginning-of-line
    bind \e\[F end-of-line
    # OS X SnowLeopard doesn't have these keys. Don't show an annoying error message.
    bind -k home beginning-of-line 2> /dev/null
    bind -k end end-of-line 2> /dev/null

    bind \cl 'clear; commandline -f repaint'
    bind \cd delete-or-exit
end

function __vi_mode_common -d "common key bindings for all vi-like modes"
    __vi_mode_common_emacs

    bind \e vi_mode_normal

    # Can we put commandline into history when pressing ^C?
    bind \cc '__vi_mode_save_cmdline; for i in (seq (count (commandline))); echo; end; commandline ""; vi_mode_insert'

    bind \n "commandline -f execute; "$vi_mode_default
    __vi_mode_user_key_bindings
end

function __vi_mode_common_insert -d "common key bindings for all insert vi-like modes"
    __vi_mode_common
    bind \e 'commandline -f backward-char; vi_mode_normal'
    if functions -q vi_mode_user
        vi_mode_user insert
    end
end

function __vi_mode_bind_directions
    __vi_mode $argv[1]

    for direction in W w E e B b 0 _ h l
        bind $direction "$argv[3]; __vi_mode_direction_command '$argv[1]' $direction; $argv[2]"
    end
    bind \$ "$argv[3]; __vi_mode_direction_command '$argv[1]' eol; $argv[2]"
    bind \^ "$argv[3]; __vi_mode_direction_command '$argv[1]' fnw; $argv[2]"
    for direction in f F t T
        bind $direction "__vi_mode_bind_all '$argv[3]; __vi_mode_direction_command %q$argv[1]%q {$direction}:%k; $argv[2]'"
    end

    bind g "__vi_mode_bind_directions_g $argv"
end

function __vi_mode_bind_directions_g
    for direction in e E
        bind $direction "$argv[3]; __vi_mode_direction_command '$argv[1]' g$direction; $argv[2]"
    end
end

function __vi_mode_bind_all
    # There seems to be some magic that doesn't work properly without this:
    bind '' self-insert

    python -c "
command = '''$argv'''
for c in map(chr, range(0x20, 0x7f)):
    q = '\"' # Enclose command in these
    Q = '\'' # Other quote - for quotes inside command
    if c == '\"':
        l = r = r'\\%s' % c
        (q, Q) = (Q, q) # Swap quotes
    elif c in ['(', ')', '<', '>', ';', '|', '\'']:
        l = r = r'\%s' % c
    elif c == '\\\\':
        l = r'\\\\'
        r = r'\\\\\\\\'
    elif c == '\$':
        l = '\%s' % c
        r = r\"'\%s'\" % c
    else:
        l = r = \"'%s'\" % c
    print ( 'bind %s %s%s%s' % (l, q, command.replace('%k', r).replace('%q', Q), q))
    " | .
end

function __vi_mode
    # Is there a way to do this without eval?
    # We really want something like a dictionary...
    eval set -g vi_mode \$vi_mode_{$argv}
    commandline -f repaint
end

function __vi_mode_replace
    __vi_mode replace
    bind --erase --all
    __vi_mode_common

    # backward-char should happen last, but only works if specified first
    # (guess I should dig through the C code and figure out what is going
    # on):
    # __vi_mode_bind_all "commandline -f delete-char; commandline -i %k; commandline -f backward-char; vi_mode_normal"
    __vi_mode_bind_all "__vi_mode_save_cmdline; commandline -f backward-char delete-char; commandline -i %k; vi_mode_normal"

    if functions -q vi_mode_user
        vi_mode_user replace
    end
end

function __vi_mode_overwrite
    __vi_mode REPLACE
    bind --erase --all
    __vi_mode_common_insert
    __vi_mode_save_cmdline

    __vi_mode_bind_all "commandline -f delete-char; commandline -i %k"
    if functions -q vi_mode_user
        vi_mode_user overwrite
    end
end

function __vi_mode_save_cmdline
    # Only vi style single level for now, patch to suppport vim style
    # multi-level undo history welcome
    set -g __vi_mode_undo_cmdline (commandline)
    set -g __vi_mode_undo_cmdline_pos (commandline -C)
end

function __vi_mode_undo
    set -l cmdline (commandline)
    set -l pos (commandline -C)
    commandline $__vi_mode_undo_cmdline
    commandline -C $__vi_mode_undo_cmdline_pos
    set -g __vi_mode_undo_cmdline $cmdline
    set -g __vi_mode_undo_cmdline_pos $pos
end

function __vi_mode_g -d "vi-like key bindings for fish (commands starting with g)"
    __vi_mode g
    bind --erase --all
    __vi_mode_bind_all 'vi_mode_normal'
    __vi_mode_common

    bind I '__vi_mode_save_cmdline; commandline -f beginning-of-line; vi_mode_insert'
    # XXX: automagic completion sometimes hides the results of changing the case in these commands:
    bind u '__vi_mode_bind_directions lower vi_mode_normal __vi_mode_save_cmdline'
    bind U '__vi_mode_bind_directions upper vi_mode_normal __vi_mode_save_cmdline'
    bind \~ '__vi_mode_bind_directions swapcase vi_mode_normal __vi_mode_save_cmdline'
    # TODO: The rest of the g commands + directions.

    __vi_mode_bind_directions_g normal vi_mode_normal ''

    if functions -q vi_mode_user
        vi_mode_user g
    end
end

function vi_mode_normal -d "WIP vi-like key bindings for fish (normal mode)"
    __vi_mode normal

    bind --erase --all

    # NOTE: bind '' self-insert seems to be required to allow the
    # prompt to change, but we don't want unbound keys to be able to
    # self-insert, so set the default binding, but bind everything to
    # do nothing (which is wasteful, but seems to work):
    __vi_mode_bind_all ''

    __vi_mode_common

    # Fish recently gained support for this, redirect to /dev/null so it
    # doesn't fall over if running an old version of fish:
    commandline -f suppress-autosuggestion 2>/dev/null

    bind i '__vi_mode_save_cmdline; vi_mode_insert'
    bind I '__vi_mode_save_cmdline; __vi_mode_direction_command normal fnw; vi_mode_insert'
    bind a '__vi_mode_save_cmdline; commandline -f forward-char; vi_mode_insert'
    bind A '__vi_mode_save_cmdline; commandline -f end-of-line; vi_mode_insert'
    bind o '__vi_mode_save_cmdline; __vi_mode_direction_command o ""; vi_mode_insert'
    bind O '__vi_mode_save_cmdline; __vi_mode_direction_command O ""; vi_mode_insert'

    # Cool, these functions are pretty close to what I wanted:
    # FIXME: Cursor not placed in correct position, but moving it prevents further searching
    bind j down-or-search
    bind k up-or-search

    bind x '__vi_mode_save_cmdline; commandline -f delete-char'
    bind D '__vi_mode_save_cmdline; commandline -f kill-line'
    # bind Y 'commandline -f kill-whole-line yank'
    bind P '__vi_mode_save_cmdline; commandline -f yank'
    bind p '__vi_mode_save_cmdline; commandline -f yank forward-char' # Yes, this is reversed. Otherwise it does the wrong thing. Go figure.
    bind C '__vi_mode_save_cmdline; commandline -f kill-line; vi_mode_insert'
    bind S '__vi_mode_save_cmdline; commandline -f kill-whole-line; vi_mode_insert'
    bind s '__vi_mode_save_cmdline; commandline -f delete-char; vi_mode_insert'
    bind r __vi_mode_replace
    bind R __vi_mode_overwrite

    # XXX: The automagic completion sometimes displays the case from the
    # command it wants to complete instead of the case actually on the
    # commandline, so even though this works, it may not always appear to work.
    # I'm not sure if I can do anything about that, I'll need to look at the
    # code. Ideally I would turn off automagic completion whenever I'm not in
    # insert mode.
    bind \~ '__vi_mode_save_cmdline; commandline -f forward-char; __vi_mode_direction_command swapcase l'

    __vi_mode_bind_directions normal vi_mode_normal ''
    bind d '__vi_mode_bind_directions delete vi_mode_normal __vi_mode_save_cmdline'
    bind c '__vi_mode_bind_directions change vi_mode_insert __vi_mode_save_cmdline'

    # Override generic direction code for simple things that have a close
    # match in fish's builtin commands, which should be faster:
    bind h backward-char
    bind l forward-char
    bind 0 beginning-of-line
    # bind \$ end-of-line #FIXME: Cursor position
    # bind b backward-word # Note: built-in implementation only recently fixed. Also, before enabling this override, determine if this matches on the right characters

    bind g __vi_mode_g # MUST BE AFTER BIND_DIRECTIONS... I'm thinking about changing it so that this is all handled by bind_directions
    bind u __vi_mode_undo

    # NOT IMPLEMENTED:
    # bind 2 vi-arg-digit
    # bind y yank-direction
    # bind g magic :-P
    # bind ^a increment next number
    # bind ^x decrement next number
    # bind /?nN search (jk kind of does this)
    # registers (maybe try to make sensible integration into X, like an
    #   explicit yank with y goes to an X selection, while an implicit
    #   delete with x etc. doesn't. "* and "+ should natually go to the
    #   appropriate X selection if possible)
    # etc.

    if functions -q vi_mode_user
        vi_mode_user normal
    end
end

function vi_mode_insert -d "vi-like key bindings for fish (insert mode)"
    __vi_mode insert

    fish_default_key_bindings

    __vi_mode_common_insert
end

function fish_user_key_bindings
  eval $vi_mode_default
end

# vi:noexpandtab:sw=4:ts=4
