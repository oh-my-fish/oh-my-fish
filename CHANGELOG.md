# Change Log
Important changes to Oh My Fish are recorded here for each release.


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


[2]: https://github.com/oh-my-fish/oh-my-fish/releases/tag/v2
[3]: https://github.com/oh-my-fish/oh-my-fish/releases/tag/v3
[#235]: https://github.com/oh-my-fish/oh-my-fish/pull/235
[#238]: https://github.com/oh-my-fish/oh-my-fish/pull/238
[#242]: https://github.com/oh-my-fish/oh-my-fish/pull/242
[#247]: https://github.com/oh-my-fish/oh-my-fish/pull/247
[#250]: https://github.com/oh-my-fish/oh-my-fish/pull/250
[#266]: https://github.com/oh-my-fish/oh-my-fish/pull/266
[#268]: https://github.com/oh-my-fish/oh-my-fish/pull/268
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
[#380]: https://github.com/oh-my-fish/oh-my-fish/pull/380
[#381]: https://github.com/oh-my-fish/oh-my-fish/pull/381
[#385]: https://github.com/oh-my-fish/oh-my-fish/pull/385
[#394]: https://github.com/oh-my-fish/oh-my-fish/pull/394
[#399]: https://github.com/oh-my-fish/oh-my-fish/pull/399
[#403]: https://github.com/oh-my-fish/oh-my-fish/pull/403
