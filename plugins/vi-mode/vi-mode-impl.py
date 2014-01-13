# This script is part of the vi-mode plugin for fish
# author: Ian Munsie
# Adapted for oh-my-fish by Sylvain Benner

import sys
from functools import reduce

command = sys.argv[1]
direction = sys.argv[2]
new_pos = pos = int(sys.argv[3])
lineno = int(sys.argv[4]) - 1
cmdline_list = sys.argv[5:]
cmdline = '\n'.join(cmdline_list)

def start():
    return (0, 0)
def end():
    return (len(cmdline), -1)
class not_found(Exception): pass

def dir_0():
    return (reduce(lambda a,b: a + len(b) + 1, cmdline_list[:lineno], 0), 0)

def dir_eol(): # end of line
    before_len = reduce(lambda a,b: a + len(b) + 1, cmdline_list[:lineno], 0)
    line_len = len(cmdline_list[lineno]) or 1
    return (before_len + line_len, -1)

# These routines are all similar, they can probably be combined into one, but
# I'll make sure I get all working and understand the differences first
def dir_fnw(): # First Non-Whitespace
    import re
    len_before = reduce(lambda a,b: a + len(b) + 1, cmdline_list[:lineno], 0)
    match = re.search('^\s*[^\s]', cmdline_list[lineno])
    if not match:
        return start()
    return (len_before + match.end()-1, 0)
dir__ = dir_fnw # XXX: I always used _ as this, but turns out that might not be quite right

def _dir_w(regexp):
    import re

    searchpart = cmdline[pos:]
    match = re.search(regexp, searchpart)
    if not match:
        return end()
    return (pos + match.end()-1, 0)

def _dir_e(regexp):
    import re

    searchpart = cmdline[pos+1:]
    match = re.search(regexp, searchpart)
    if not match:
        return end()
    return (pos+2 + match.start(), -1)

def _dir_b(regexp):
    import re

    if pos == 0:
        return start()

    # Reverse the string instead of matching to right:
    searchpart = cmdline[pos-1::-1]
    match = re.search(regexp, searchpart)
    if not match:
        return start()
    return (len(searchpart) - (match.start()+1), 0)

def _dir_ge(regexp):
    import re

    if pos == 0:
        return start()

    # Reverse the string instead of matching to right:
    searchpart = cmdline[pos::-1]
    match = re.search(regexp, searchpart)
    if not match:
        return start()
    return (len(searchpart) - (match.end()), 0)

# Simple, but not inclusive enough:
# def dir_w(): return _dir_w(r'[^\w]\w')
# def dir_e(): return _dir_e(r'\w[^\w]')

# Slightly too inclusive, e.g. fi--sh matches both '-' characters, but should only match one:
_dir_w_regexp = r'[^\w][^\s]|\w[^\w\s]'
_dir_e_regexp = r'[^\s][^\w]|[^\w\s]\w'
_dir_W_regexp = r'\s[^\s]'
_dir_E_regexp = r'[^\s]\s'

def dir_w(): return _dir_w(_dir_w_regexp)
def dir_W(): return _dir_w(_dir_W_regexp)
def dir_e(): return _dir_e(_dir_e_regexp)
def dir_E(): return _dir_e(_dir_E_regexp)
def dir_b(): return _dir_b(_dir_e_regexp)
def dir_B(): return _dir_b(_dir_E_regexp)
def dir_ge(): return _dir_ge(_dir_w_regexp)
def dir_gE(): return _dir_ge(_dir_W_regexp)
def dir_cw(): return _dir_w(_dir_e_regexp)
def dir_cW(): return _dir_w(_dir_E_regexp)

def dir_h():
    if pos: return (pos-1, 0)
    return start()

def dir_l():
    return (pos+1, 0)

def dir_t(char):
    new_pos = cmdline.find(char, pos+1)
    if new_pos < 0:
        raise not_found
    return (new_pos, -1)

def dir_T(char):
    new_pos = cmdline.rfind(char, 0, pos)
    if new_pos < 0:
        raise not_found
    return (new_pos+1, 0)

def dir_f(char): return (dir_t(char)[0]+1, -1)
def dir_F(char): return (dir_T(char)[0]-1, 0)

def cmd_delete():
    dst_pos = dir(direction)
    if dst_pos >= pos:
        new_cmdline = cmdline[:pos] + cmdline[dst_pos:]
        return (new_cmdline, pos)
    new_cmdline = cmdline[:dst_pos] + cmdline[pos:]
    return (new_cmdline, dst_pos)

def cmd_change():
    # 'Special case: 'cw' and 'cW' are treated like 'ce' and 'cE' if the cursor
    # is on a non-blank.  This is because 'cw' is interpreted as change-word,
    # and a word does not include the following white space.'
    #
    # Note: Even with this special case the behaviour does not quite match what
    # vim actually does in practice - try with the cursor on punctuation, or on
    # the last character in a word. Specifically, the behaviour of cw differs
    # from ce when the cursor is already on the last character of a 'word', for
    # vim's definition of word.
    #
    # Because of this, we use a special direction to handle this case.
    global direction
    if direction in 'wW' and not cmdline[pos].isspace():
        direction = direction.replace('w', 'cw').replace('W', 'cW')
    return cmd_delete()

def cmd_o():
    above = '\n'.join(cmdline_list[:lineno + 1])
    below = '\n'.join(cmdline_list[lineno + 1:])
    return (above + '\n\n' + below, len(above)+1)

def cmd_O():
    above = '\n'.join(cmdline_list[:lineno])
    below = '\n'.join(cmdline_list[lineno:])
    return (above + '\n\n' + below, len(above)+1)

def _dir_cmd_func(func):
    (pos1, pos2) = (pos, dir(direction))
    if pos2 < pos:
        (pos1, pos2) = (pos2, pos1)
    new_cmdline = cmdline[:pos1] + func(cmdline[pos1:pos2]) + cmdline[pos2:]
    return (new_cmdline, pos1)

# XXX: automagic completion sometimes hides the results of changing the case in these commands:
def cmd_upper(): return _dir_cmd_func(str.upper)
def cmd_lower(): return _dir_cmd_func(str.lower)
def cmd_swapcase():  return _dir_cmd_func(str.swapcase)

def dir(d, cursor = False):
    def validate(pos):
        if pos < 0: return 0
        if pos > len(cmdline): return len(cmdline)
        return pos
    a = ()
    if ':' in d:
        (d, a) = d.split(':', 1)
    (new_pos, cursor_off) = globals()['dir_%s' % d](*a)
    if cursor:
        return validate(new_pos + cursor_off)
    return validate(new_pos)

def cmd(c): return globals()['cmd_%s' % c]()

def cmd_normal():
    return (None, dir(direction, True))

try:
    (cmdline, new_pos) = cmd(command)
    if cmdline is not None:
        print ( cmdline )
except not_found:
    new_pos = pos
print ( new_pos )
