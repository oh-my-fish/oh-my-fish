# Change Log
Important changes to Oh My Fish are recorded here for each release.


## Unreleased
- Key bindings are now fully supported in user config and in plugins. Bindings should be placed in a `key_bindings.fish` script and will be loaded automatically.
- Init process completely rewritten to improve performance and correctness. Using `on_{plugin}` events for plugin initialization is now deprecated and will eventually be removed. `init.fish` scripts will be sourced directly and are passed the variables `$path`, `$package`, and `$bundle`.
- Installer now checks for fish 2.2.0 or newer.
- New plugins: docker-machine, exenv, proxy, sudope, wttr
- Documentation fixes.

### Contributors
- Denis Koltsov
- Derek Willian Stavis
- Douglas Camata
- Itzik Ephraim
- John Rizzo
- Luís Fiolhais
- Pablo Santiago Blum de Aguiar
- Pedro Medeiros
- Stephen M. Coakley
- Wild Kat


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
[#235]: https://github.com/oh-my-fish/oh-my-fish/pull/235
[#238]: https://github.com/oh-my-fish/oh-my-fish/pull/238
[#242]: https://github.com/oh-my-fish/oh-my-fish/pull/242
[#247]: https://github.com/oh-my-fish/oh-my-fish/pull/247
[#250]: https://github.com/oh-my-fish/oh-my-fish/pull/250
[#266]: https://github.com/oh-my-fish/oh-my-fish/pull/266
[#268]: https://github.com/oh-my-fish/oh-my-fish/pull/268
[#280]: https://github.com/oh-my-fish/oh-my-fish/pull/280
[#285]: https://github.com/oh-my-fish/oh-my-fish/pull/285
[#287]: https://github.com/oh-my-fish/oh-my-fish/pull/287
[#289]: https://github.com/oh-my-fish/oh-my-fish/pull/289
[#291]: https://github.com/oh-my-fish/oh-my-fish/pull/291
[#305]: https://github.com/oh-my-fish/oh-my-fish/pull/305
[#310]: https://github.com/oh-my-fish/oh-my-fish/pull/310
[#314]: https://github.com/oh-my-fish/oh-my-fish/pull/314