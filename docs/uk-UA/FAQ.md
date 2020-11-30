<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# FAQ

> Oh My Fish Documentation&nbsp;&bull;&nbsp;Also in
> <a href="../en-US/FAQ.md">🇺🇸</a>
> <a href="../es-ES/FAQ.md">🇪🇸</a>
> <a href="../nl-NL/FAQ.md">🇳🇱</a>
> <a href="../pt-BR/FAQ.md">🇧🇷</a>
> <a href="../ru-RU/FAQ.md">🇷🇺</a>
> <a href="../zh-CN/FAQ.md">🇨🇳</a>

<br>

Дякуємо, що знайшли час прочитати цей FAQ. Не соромтесь створювати новий Issue, якщо Ви не змогли знайти відповідь на своє питання тут.


## Що таке Oh My Fish та для чого він мені потрібен?

Oh My Fish це _фреймворк_ для [Fishshell](http://fishshell.com/). Він допомагає в керуванні Вашими налаштуваннями, темами та пакетами.


## Що мені потрібно знати, для того щоб використовувати Oh My Fish?

_Нічого_. Ви можете встановити Oh My Fish та продовжувати використовувати Fish як зазвичай. Коли Ви захочете дізнатися більше, просто наберіть `omf help`.


## Що таке пакети в Oh My Fish?

Пакети в Oh My Fish - це теми та плагіни, написані на fish, які наслідують базову функціональність Shell, запускають код під час ініціалізації, додають автодоповнення до знайомих утиліт, тощо.


## Які типи пакетів існують в Oh My Fish?

Існує 3 основних типи пакетів:

1. Конфігураційні утиліти. Наприклад, [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv) перевіряє, чи існує `pyenv` у вашій системі та запускає `(pyenv init - | psub)` для вас при запуску Fish.

2. Теми. Ознайомитися з ними можна [тут](https://github.com/oh-my-fish).

3. Традиційні утиліти оболонки. Наприклад, [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy) — утиліта буферу обміну, сумісна із Linux та OSX.


## Що саме робить Oh My Fish?

+ Запускає `$OMF_CONFIG/before.init.fish`, якщо доступно.

+ Автозавантаження встановлених пакетів та тем із `$OMF_PATH/`.

+ Автозавантаження шляху до вашого конфігу. За замовчуванням це `~/.config/omf`, але його можна налаштувати через `$OMF_CONFIG`.

+ Автозавантаження будь-яких `функцій` із `$OMF_PATH` та `$OMF_CONFIG`

+ Запускає `$OMF_CONFIG/init.fish`, якщо доступно.


## Як я можу оновити поточну версію Oh My Fish?

> :warning: Не забудьте спочатку зробити резервну копію ваших dotfiles та інших важливих данних.

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

Тепер ви можете безпечно видалити `$fish_path`.

```fish
rm -rf "$fish_path"
```


## Як я можу використовувати fish в якості оболонки за замовуванням?

Додайте Fish в `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

Зробіть Fish вашою оболонкою за замовчуванням:

```sh
chsh -s /usr/local/bin/fish
```

Для того щоб переключитися на іншу оболонку:
> Замініть `/bin/bash` на `/bin/tcsh` або `/bin/zsh` для відповідних оболонок.

```sh
chsh -s /bin/bash
```
