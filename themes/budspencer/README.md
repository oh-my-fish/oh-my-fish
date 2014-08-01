# budspencer theme

Translation of zsh's prezto [budspencer theme][budspencer]

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
- Git status
  * style can be toggled in NORMAL mode with `,,` between
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
  * style can be toggled in NORMAL mode with space bar
  * styles implemented:
    - `short` (show truncated path)
    - `long` (show full path)
    - `none` (show nothing)
  * configurable by global array `$PWDSTYLE` (if not set, defaults to `short long none`)

## Screenshot

![budspencer theme][screenshot]

## TODO

- elapsed time indicator
- host/username indicator for ssh connections
- vi REPLACE mode

[budspencer]: https://github.com/tannhuber/prezto
[ranger]: http://ranger.nongnu.org/
[screenshot]: https://raw.githubusercontent.com/tannhuber/prezto/master/screenshots/budspencer.png
