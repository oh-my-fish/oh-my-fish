# budspencer theme

Translation of zsh's prezto [budspencer theme][budspencer].

## Configuration

The theme behaves similar to vim's airline/powerline plugins. It needs a
[powerline font][font]. Although it works with emacs mode, it's more powerful
with vi mode. In order to enable vi mode, put the following lines into
`$HOME/.config/fish/config.fish` before `set fish_path $HOME/.oh-my-fish`:

```
set -e fish_key_bindings
set -U fish_key_bindings fish_vi_key_bindings
```

## Left prompt segments

- Vi mode indicator
- Git repository information
- Status symbols
  * V: vi is parent process
  * R: [ranger][ranger] is parent process
  * ⚙: there are background jobs
  * : no write permissions in present working directory
  * ✔: last command succeeded
  * ✘: last command failed
  * ⚡: superuser indicator

## Right prompt segments

- Last command's duration time
- Git status
  * style can be toggled in NORMAL and in VISUAL mode with `#` between
    - `symbols` (shows git status symbols, see below)
    - `counts` (shows amount of files that are affected)
  * symbols:
    - ↑: git repository is ahead origin
    - ↓: git repository is behind origin
    - +: new files were added
    - –: files have been deleted
    - ✱: files have been modified
    - →: files have been renamed
    - ═: there are unmerged commits
    - ●: there are untracked files
    - ✭: there are stashed commits
- Present working directory
  * style can be toggled in NORMAL and in VISUAL mode with space bar
  * styles implemented:
    - `short` (show truncated path)
    - `long` (show full path)
    - `none` (show nothing)
  * configurable by global array `$PWDSTYLE` (if not set, defaults to `short long none`)

## Screenshot

![budspencer theme][screenshot]

## TODO

- vi REPLACE mode, as soon as REPLACE mode is implemented within fish

[budspencer]: https://github.com/tannhuber/prezto
[font]: https://github.com/Lokaltog/powerline-fonts
[ranger]: http://ranger.nongnu.org/
[screenshot]: https://raw.githubusercontent.com/tannhuber/prezto/master/screenshots/budspencer.png
