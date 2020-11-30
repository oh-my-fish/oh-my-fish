<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# FAQ

> Oh My Fish Documentation&nbsp;&bull;&nbsp;Also in
> <a href="../en-US/FAQ.md">🇺🇸</a>
> <a href="../es-ES/FAQ.md">🇪🇸</a>
> <a href="../nl-NL/FAQ.md">🇳🇱</a>
> <a href="../pt-BR/FAQ.md">🇧🇷</a>
> <a href="../uk-UA/FAQ.md">🇺🇦</a>
> <a href="../zh-CN/FAQ.md">🇨🇳</a>

<br>

Спасибо, что нашли время прочитать этот FAQ. Не стесняйтесь создавать новый Issue, если вы не нашли тут ответ на свой вопрос.


## Что такое Oh My Fish и зачем он мне нужен?

Oh My Fish это _фреймворк_ для [Fishshell](http://fishshell.com/). Он помогает вам управлять Вашими настройками, темами и пакетами.


## Что мне нужно знать, чтобы использовать Oh My Fish?

_Ничего_. Вы можете установить Oh My Fish и продолжать использовать Fish как обычно. Когда вы захотите узнать больше, просто наберите `omf help`.


## Что такое пакеты в Oh My Fish?

Пакеты в Oh My Fish - это темы и плагины, написанные на fish, которые наследуют базовую функциональность Shell, запускают код во время инициализации, добавляют автодополнение к известным утилитам и тд.


## Какие типы пакетов существуют в Oh My Fish?

Существует 3 основных вида пакетов:

1. Конфигурационные утилиты. Например, [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv) проверяет, существует ли `pyenv` в вашей системе и запускает `(pyenv init - | psub)` для вас при запуске Fish.

2. Темы. Ознакомьтесь с [темами](https://github.com/oh-my-fish).

3. Традиционные утилиты оболочки. Например, [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy) — утилита буфера обмена, совместимая с Linux и OSX.


## Что именно делает Oh My Fish?

+ Запускает `$OMF_CONFIG/before.init.fish`, если доступно.

+ Автозагрузка установленных пакетов и тем из `$OMF_PATH/`.

+ Автозагрузка пути к вашему конфигу. По умолчанию это `~/.config/omf` по умолчанию, но его можно настроить через `$OMF_CONFIG`.

+ Автозагрузка любых `функций` из `$OMF_PATH` и `$OMF_CONFIG`

+ Запускает `$OMF_CONFIG/init.fish`, если доступно.


## Как я могу обновить текущую версию Oh My Fish?

> :warning: Не забудьте сперва сделать резервную копию ваших dotfiles и других важных данных.

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

Теперь вы можете безопасно удалить `$fish_path`.

```fish
rm -rf "$fish_path"
```


## Как я могу использовать fish в качестве оболочки по умолчанию?

Добавьте Fish в `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

Сделайте Fish вашей оболочкой по умолчанию:

```sh
chsh -s /usr/local/bin/fish
```

Чтобы обратно переключиться на оболочку по умолчанию:
> Замените `/bin/bash` с `/bin/tcsh` или `/bin/zsh` в соответствующих случаях.

```sh
chsh -s /bin/bash
```
