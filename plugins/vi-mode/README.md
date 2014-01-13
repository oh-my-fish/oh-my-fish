# vi-mode
Basic vi key bindings emulation for fish.

## Install
Add `vi-mode` to your list of fish plugins in your `config.fish`.

Example:

    set fish_plugins autojump vi-mode

## Configuration
### Default mode
The default vi mode can be set by defining the variable `vi_mode_default` in
your `config.fish`.
If used, this variable must be set before loading `oh-my-fish`.
Its default value is `vi_mode_insert`.

To set normal mode as default:

    set vi_mode_default vi_mode_normal

### Mode indicator
The mode indicator is stored in the variable `vi_mode`.

See the oh-my-fish theme `simplevi` for an example of integration of the
indicator into the prompt.

### User key bindings
User additional key bindings can be defined with the function
`vi_mode_user_key_bindings`. If used, this function must be defined before
loading `oh-my-fish`.

Example:

    function vi_mode_user_key_bindings
        bind \el  suppress-autosuggestion
    end

## Not implemented
- bind 2 vi-arg-digit
- bind y yank-direction
- bind g magic :-P
- bind ^a increment next number
- bind ^x decrement next number
- bind /?nN search (jk kind of does this)
- registers (maybe try to make sensible integration into X, like an
  explicit yank with y goes to an X selection, while an implicit
  delete with x etc. doesn't. "\* and "+ should natually go to the
  appropriate X selection if possible)
- etc.

## Author
This mode has been created by [Ian Munsie][ian_github], the original file can
be found [here][original].
It has been adapted for oh-my-fish by [Sylvain Benner][syl_github].

[ian_github]: https://github.com/DarkStarSword
[original]: https://github.com/DarkStarSword/junk/blob/master/vi-mode.fish
[syl_github]: https://github.com/syl20bnr



