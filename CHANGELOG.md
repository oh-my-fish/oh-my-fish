# Change Log
Important changes to Oh My Fish are recorded here for each release.


## [6] - 2017-10-05
This release took far longer than we targeted for releasing, but we finally made it! Some notable fixes and improvements in this release, with some long-standing bugs eliminated.

A big shiny improvement was made to the command-line help text, with more manpage-like output and descriptions. Check out `omf help -h` to see the brand new `help` command, which now supports shortened command names too! (Try running `omf help u`.) All of the help pages are also viewable online here: https://github.com/oh-my-fish/oh-my-fish/tree/master/docs/cli

### Improvements
- Revamp internal help text code and improve command-line help documentation. [#502]
- Use HTTPS in all links to the installer. [#482] [#490]
- Add a SHA-256 checksum for the installer. [#504]
- Search results should only match name or description. [#505]

### Bugs fixed
- Scaffolding a new theme spits out weird error messages. [#401] [#529] [#530]
- Handle backups and config files more carefully. [#509] [#512]
- Themes should not require a `theme-` prefix in the URL. [#191] [#503]
- Gracefully handle no theme being set. [#494] [#495]
- Documentation fixes and improvements. [#493] [#507] [#508] [#520] [#543] [#546] [#548]

### New plugins and themes
- Plugins and themes are now tracked separately! Watch the [packages-main] repo for new plugins and themes.

### Contributors
Thanks to the people who contributed to this release.

- [Dalton Duvio](mailto:thebigdalt@gmail.com)
- [Gabriel César](mailto:gcal1@live.com)
- [Itzik Ephraim](mailto:oranja@gmail.com)
- [Justin Hileman](mailto:github@0x7f.us)
- [Leonardo de Oliveira da Silva](mailto:los.oliveirasilva@gmail.com)
- [Lucas Bordignon](mailto:lucaspbordignon99@gmail.com)
- [Necmettin Karakaya](mailto:necmettin.karakaya@gmail.com)
- [pwendelboe](mailto:pwendelboe.git@gmail.com)
- [Stephen M. Coakley](mailto:me@stephencoakley.com)


## [5] - 2017-02-11
### Added
- Replace package database with new, independently installed package repository system. Packages are no longer stored in the framework repository tree. Instead packages are stored in a package repository, a Git repo with a list of available packages. Multiple sources are supported, with the old database contents moved to the [packages-main] repository. [#427]

### Bugs fixed
- Fix function paths when switching themes during runtime without a reload. Previously if a theme had a `functions` directory, it was only added to the function path at init time and not removed when switching themes. [#479] [#485]
- Ignore ".git" suffix on theme URLs in the Themes document generator. [#472]
- Documentation fixes and improvements. [#481]

### New plugins
- [blt](https://github.com/devert/plugin-blt)
- [fish_logo](https://github.com/HenrikWL/plugin-fish_logo)

### New themes
- [gentoo](https://github.com/ribugent/theme-gentoo)
- [emoji-powerline](https://github.com/wyqydsyq/emoji-powerline)
- [one](https://github.com/fivepointseven/omf-theme-one)

### Contributors
Thanks to the people who contributed to this release.

- [Damon Poole](mailto:pyrokinetiq@gmail.com)
- [Dennis Evert](mailto:dennisevert@gmail.com)
- [Gerard Ribugent Navarro](mailto:ribugent@gmail.com)
- [Henrik W Lund](mailto:henrik.w.lund@gmail.com)
- [Itzik Ephraim](mailto:oranja@gmail.com)
- [Justin Hileman](mailto:github@0x7f.us)
- [Pablo Santiago Blum de Aguiar](mailto:scorphus@gmail.com)
- [Stephen M. Coakley](mailto:me@stephencoakley.com)


## [4] - 2017-01-04
### Added
- The Doctor (`omf doctor`) now prints some additional info for ease in troubleshooting common problems. [#456]
- New script for generating the `AUTHORS` file automatically from Git history. [#426]
- Translate documentation into Ukrainian. [#464]

### Bugs fixed
- Fix common issues we've had with platform line endings and Git `autocrlf` and other line-ending settings. [#217] [#379] [#444] [#458]
- Compatibility fixes for Fish 2.4.0. [#459]
- If there is an existing theme set up, do not replace it when installing Oh My Fish for the first time. [#274] [#435]
- Do not use Fish color variables for the default theme. This helps ensure the theme looks correct under any version of Fish. [#440] [#446]
- Documentation fixes. [#418] [#457]

### New plugins
- [bak](https://github.com/oh-my-fish/plugin-bak)
- [dpaste](https://github.com/oh-my-fish/plugin-dpaste)
- [marlin](https://github.com/oh-my-fish/marlin)
- [pj](https://github.com/oh-my-fish/plugin-pj)
- [pyenv](https://github.com/oh-my-fish/plugin-pyenv)

### New themes
- [kawasaki](https://github.com/hastinbe/theme-kawasaki)
- [slavic-cat](https://github.com/yangwao/omf-theme-slavic-cat)

### Contributors
Thanks to the people who contributed to this release.

- [Andrew Komarnitskyi](mailto:ticapac@gmail.com)
- [Beau Hastings](mailto:beausy@gmail.com)
- [Derek Willian Stavis](mailto:dekestavis@gmail.com)
- [Espen Henriksen](mailto:esphen@users.noreply.github.com)
- [hak8or](mailto:hak8or@users.noreply.github.com)
- [Justin Hileman](mailto:github@0x7f.us)
- [Matej Nemček](mailto:ybdaba@gmail.com)
- [Roman Inflianskas](mailto:rominf@users.noreply.github.com)
- [Stephen M. Coakley](mailto:me@stephencoakley.com)


## [3] - 2016-10-20
- Key bindings are now fully supported in user config and in plugins. Bindings should be placed in a `key_bindings.fish` script and will be loaded automatically. [#368] [#355] [#334]
- Init process completely rewritten to improve performance and correctness. Using `on_{plugin}` events for plugin initialization is now deprecated and will eventually be removed. `init.fish` scripts will be sourced directly and are passed the variables `$path`, `$package`, and `$bundle`. [#343] [#335]
- Revamped _hooks_ system that allows plugins to register scripts to be executed on certain events. Hooks are now located in `{plugin}/hooks` (except for `init` and `key_bindings`) and are regular Fish scripts named after the target hook event. Adds support for `install` and `update` hooks. See the [package docs](docs/en-US/Packages.md) for details. [#286]
- Completely new interactive installer written for correctness that no longer overwrites any existing usr config files. Also supports offline installs. [#399] [#385] [#381] [#361] [#330]
- The core framework updater now respects release versions and by default upgrades between tagged releases only. Run `omf channel dev` to receive updates from `master`. [#293]
- Fixes for Fish 2.3.* compatibility. [#327] [#325]
- `omf update` now returns the correct output and exit status. [#394] [#365]
- Fix errors shown for the default theme when in a Git detached head. [#366]
- Update templates for new plugins. [#403] [#333]
- Documentation fixes and improvements. [#380] [#378] [#373] [#371] [#370] [#369] [#354] [#345]

### New plugins
- [android-sdk](https://github.com/oh-my-fish/plugin-android-sdk)
- [archlinux](https://github.com/oh-my-fish/plugin-archlinux)
- [aws](https://github.com/oh-my-fish/plugin-aws)
- [cd](https://github.com/oh-my-fish/plugin-cd)
- [docker-machine](https://github.com/oh-my-fish/plugin-docker-machine)
- [exenv](https://github.com/oh-my-fish/plugin-exenv)
- [gityaw](https://github.com/oh-my-fish/plugin-gityaw)
- [license](https://github.com/oh-my-fish/plugin-license)
- [mou](https://github.com/oh-my-fish/plugin-mou)
- [node-binpath](https://github.com/oh-my-fish/plugin-node-binpath)
- [nodenv](https://github.com/oh-my-fish/plugin-nodenv)
- [proxy](https://github.com/oh-my-fish/plugin-proxy)
- [spark](https://github.com/oh-my-fish/plugin-spark)
- [sudope](https://github.com/oh-my-fish/plugin-sudope)
- [virtualfish](https://github.com/oh-my-fish/plugin-virtualfish)
- [wifi-password](https://github.com/oh-my-fish/plugin-wifi-password)
- [wttr](https://github.com/oh-my-fish/plugin-wttr)

### New themes
- [eden](https://github.com/oh-my-fish/theme-eden)
- [fishbone](https://github.com/oh-my-fish/theme-fishbone)

### Contributors
- [Amio • 晋晓炜](mailto:amio.cn@gmail.com)
- [Denis Koltsov](mailto:koltsov.d@gmail.com)
- [Derek Willian Stavis](mailto:dekestavis@gmail.com)
- [Douglas Camata](mailto:d.camata@gmail.com)
- [Guilherme Rv Coelho](mailto:grvcoelho@users.noreply.github.com)
- [Gustavo Pantuza Coelho Pinto](mailto:gustavopantuza@gmail.com)
- [Itzik Ephraim](mailto:oranja@gmail.com)
- [Jianming Qu](mailto:sancoder.q@gmail.com)
- [John Rizzo](mailto:johnrizzo1@gmail.com)
- [Justin Hileman](mailto:github@0x7f.us)
- [Luís Fiolhais](mailto:luisazenhas.fiolhais@gmail.com)
- [Mathias Djärv](mailto:mathias.djarv@gmail.com)
- [Nathan Wykes](mailto:nwykes@users.noreply.github.com)
- [Pablo Santiago Blum de Aguiar](mailto:scorphus@gmail.com)
- [Pedro Medeiros](mailto:pedrosnk@gmail.com)
- [Sergey Timanin](mailto:timanin@gmail.com)
- [Stephen M. Coakley](mailto:me@stephencoakley.com)
- [Wild Kat](mailto:wk@users.noreply.github.com)


## [2] - 2016-05-11
- A new package searching command was added for better discoverability. Invoke it with `omf search`. See `omf help search` on how to use this new command. [#314]
- `omf doctor` now checks for good versions of Fish and Git to be installed. [#280]
- `omf update` can now update specific packages instead of just everything. [#268]
- `refresh` has been replaced with `omf reload`, which is much safer. [#266]
- New packages added to the database: rustup, linuxbrew, await, hash, expand, argu, termux, phpbrew, config
- New themes: mokou, qing, mars, chain, es, lolfish, lambda, pure
- Numerous bugfixes to existing features. [#310], [#305], [#287], [#285], [#247], [#242]
- Documentation fixes and improvements: [#291], [#289], [#250], [#238], [#235]

### Contributors
- Andrew Rynhard
- Boris Korogvich
- Bruno Pinto
- cotne nazarashvili
- Cyan
- Derek Willian Stavis
- eugenesvk
- Hasan Ozgan
- Hyeon Kim
- Itzik Ephraim
- jona
- Justin Hileman
- Katya Demidova
- Luís Fiolhais
- Mathias Rasmussen
- Miguel Molina
- Roman Inflianskas
- Sheldon Els
- Sobolev Nikita
- Stephen M. Coakley
- szwathub


[packages-main]: https://github.com/oh-my-fish/packages-main
[2]: https://github.com/oh-my-fish/oh-my-fish/releases/tag/v2
[3]: https://github.com/oh-my-fish/oh-my-fish/releases/tag/v3
[4]: https://github.com/oh-my-fish/oh-my-fish/releases/tag/v4
[5]: https://github.com/oh-my-fish/oh-my-fish/releases/tag/v5
[6]: https://github.com/oh-my-fish/oh-my-fish/releases/tag/v6
[#191]: https://github.com/oh-my-fish/oh-my-fish/issues/191
[#217]: https://github.com/oh-my-fish/oh-my-fish/issues/217
[#235]: https://github.com/oh-my-fish/oh-my-fish/pull/235
[#238]: https://github.com/oh-my-fish/oh-my-fish/pull/238
[#242]: https://github.com/oh-my-fish/oh-my-fish/pull/242
[#247]: https://github.com/oh-my-fish/oh-my-fish/pull/247
[#250]: https://github.com/oh-my-fish/oh-my-fish/pull/250
[#266]: https://github.com/oh-my-fish/oh-my-fish/pull/266
[#268]: https://github.com/oh-my-fish/oh-my-fish/pull/268
[#274]: https://github.com/oh-my-fish/oh-my-fish/issues/274
[#280]: https://github.com/oh-my-fish/oh-my-fish/pull/280
[#285]: https://github.com/oh-my-fish/oh-my-fish/pull/285
[#286]: https://github.com/oh-my-fish/oh-my-fish/pull/286
[#287]: https://github.com/oh-my-fish/oh-my-fish/pull/287
[#289]: https://github.com/oh-my-fish/oh-my-fish/pull/289
[#291]: https://github.com/oh-my-fish/oh-my-fish/pull/291
[#293]: https://github.com/oh-my-fish/oh-my-fish/pull/293
[#305]: https://github.com/oh-my-fish/oh-my-fish/pull/305
[#310]: https://github.com/oh-my-fish/oh-my-fish/pull/310
[#314]: https://github.com/oh-my-fish/oh-my-fish/pull/314
[#325]: https://github.com/oh-my-fish/oh-my-fish/pull/325
[#327]: https://github.com/oh-my-fish/oh-my-fish/pull/327
[#330]: https://github.com/oh-my-fish/oh-my-fish/pull/330
[#333]: https://github.com/oh-my-fish/oh-my-fish/pull/333
[#334]: https://github.com/oh-my-fish/oh-my-fish/pull/334
[#335]: https://github.com/oh-my-fish/oh-my-fish/pull/335
[#343]: https://github.com/oh-my-fish/oh-my-fish/pull/343
[#345]: https://github.com/oh-my-fish/oh-my-fish/pull/345
[#354]: https://github.com/oh-my-fish/oh-my-fish/pull/354
[#355]: https://github.com/oh-my-fish/oh-my-fish/pull/355
[#361]: https://github.com/oh-my-fish/oh-my-fish/pull/361
[#365]: https://github.com/oh-my-fish/oh-my-fish/pull/365
[#366]: https://github.com/oh-my-fish/oh-my-fish/pull/366
[#368]: https://github.com/oh-my-fish/oh-my-fish/pull/368
[#369]: https://github.com/oh-my-fish/oh-my-fish/pull/369
[#370]: https://github.com/oh-my-fish/oh-my-fish/pull/370
[#371]: https://github.com/oh-my-fish/oh-my-fish/pull/371
[#373]: https://github.com/oh-my-fish/oh-my-fish/pull/373
[#378]: https://github.com/oh-my-fish/oh-my-fish/pull/378
[#379]: https://github.com/oh-my-fish/oh-my-fish/issues/379
[#380]: https://github.com/oh-my-fish/oh-my-fish/pull/380
[#381]: https://github.com/oh-my-fish/oh-my-fish/pull/381
[#385]: https://github.com/oh-my-fish/oh-my-fish/pull/385
[#394]: https://github.com/oh-my-fish/oh-my-fish/pull/394
[#399]: https://github.com/oh-my-fish/oh-my-fish/pull/399
[#401]: https://github.com/oh-my-fish/oh-my-fish/issues/401
[#403]: https://github.com/oh-my-fish/oh-my-fish/pull/403
[#418]: https://github.com/oh-my-fish/oh-my-fish/pull/418
[#426]: https://github.com/oh-my-fish/oh-my-fish/pull/426
[#427]: https://github.com/oh-my-fish/oh-my-fish/pull/427
[#435]: https://github.com/oh-my-fish/oh-my-fish/pull/435
[#440]: https://github.com/oh-my-fish/oh-my-fish/issues/440
[#444]: https://github.com/oh-my-fish/oh-my-fish/issues/444
[#446]: https://github.com/oh-my-fish/oh-my-fish/pull/446
[#456]: https://github.com/oh-my-fish/oh-my-fish/pull/456
[#457]: https://github.com/oh-my-fish/oh-my-fish/pull/457
[#458]: https://github.com/oh-my-fish/oh-my-fish/pull/458
[#459]: https://github.com/oh-my-fish/oh-my-fish/pull/459
[#464]: https://github.com/oh-my-fish/oh-my-fish/pull/464
[#472]: https://github.com/oh-my-fish/oh-my-fish/pull/472
[#479]: https://github.com/oh-my-fish/oh-my-fish/issues/479
[#481]: https://github.com/oh-my-fish/oh-my-fish/pull/481
[#482]: https://github.com/oh-my-fish/oh-my-fish/issues/482
[#485]: https://github.com/oh-my-fish/oh-my-fish/pull/485
[#490]: https://github.com/oh-my-fish/oh-my-fish/pull/490
[#493]: https://github.com/oh-my-fish/oh-my-fish/pull/493
[#494]: https://github.com/oh-my-fish/oh-my-fish/issues/494
[#495]: https://github.com/oh-my-fish/oh-my-fish/pull/495
[#502]: https://github.com/oh-my-fish/oh-my-fish/pull/502
[#503]: https://github.com/oh-my-fish/oh-my-fish/pull/503
[#504]: https://github.com/oh-my-fish/oh-my-fish/pull/504
[#505]: https://github.com/oh-my-fish/oh-my-fish/pull/505
[#507]: https://github.com/oh-my-fish/oh-my-fish/pull/507
[#508]: https://github.com/oh-my-fish/oh-my-fish/pull/508
[#509]: https://github.com/oh-my-fish/oh-my-fish/issues/509
[#512]: https://github.com/oh-my-fish/oh-my-fish/pull/512
[#520]: https://github.com/oh-my-fish/oh-my-fish/pull/520
[#529]: https://github.com/oh-my-fish/oh-my-fish/issues/529
[#530]: https://github.com/oh-my-fish/oh-my-fish/pull/530
[#543]: https://github.com/oh-my-fish/oh-my-fish/pull/543
[#546]: https://github.com/oh-my-fish/oh-my-fish/pull/546
[#548]: https://github.com/oh-my-fish/oh-my-fish/pull/548
