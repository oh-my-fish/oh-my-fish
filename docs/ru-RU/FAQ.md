<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <a href="../en-US/FAQ.md">English</a> &bull;
  <a href="../zh-CN/FAQ.md">简体中文</a> &bull;
  <b>Русский</b>

</p>


# FAQ

Спасибо что нашли время прочитать этот FAQ. Не стесняйтесь создавать новый Issue если вы не нашли тут ответ на свой вопрос.


## Что такое Oh My Fish и зачем он мне нужен?

Oh My Fish это _фреймворк_ для [Fishshell](http://fishshell.com/). Он помогает Вам управлять Вашими настройками, темами и пакетами.


## Что мне нужно знать чтобы использовать Oh My Fish?

_Ничего_. Вы можете установить Oh My Fish и продолжать использовать Fish как обычно. Когда Вы захотите узнать больше просто наберите `omf help`.


## Что такое пакеты в Oh My Fish?

Пакеты в Oh My Fish - это темы и плагины, написанные на fish которые наследуют базовую функциональность Shell, запускают код во время инициализации, добавляют автодополнение к известным утилитам и тд.


## Какие типы пакетов существуют в Oh My Fish?

Существует 3 основных вида пакетов:

1. Конфигурационные утилиты. Например [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv) проверяет существует ли `pyenv` в Вашей системе и запускает `(pyenv init - | psub)` для Вас при запуске Fish.

2. Темы. Ознакомьтесь с [темами](https://github.com/oh-my-fish).

3. Традиционные утилиты оболочки. Например [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy), утилита буфера обмена, совместимая с Linux и OSX.


## Что именно делает Oh My Fish?

+ Запускает `$OMF_CONFIG/before.init.fish` если доступно.

+ Автозагрузка установленных пакетов и тем из `$OMF_PATH/`.

+ Автозагрузка пути к Вашему конфигу. `~/.config/omf` по умолчанию, но конфигурируемый через `$OMF_CONFIG`.

+ Автозагрузка любых `функций` из `$OMF_PATH` и `$OMF_CONFIG`

+ Запускает `$OMF_CONFIG/init.fish` если доступно.


## Как я могу обновить текущую версию Oh My Fish?

> :предупреждение: Не забудьте сперва сделать резервную копию Ваших dotfiles и других важных данных.

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

Теперь Вы можете безопасно удалить `$fish_path`.

```fish
rm -rf "$fish_path"
```


## Как я могу использовать fish в качестве оболочки по умолчанию?

Добавьте Fish в `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

Сделайте Fish Вашей оболочкой по умолчанию:

```sh
chsh -s /usr/local/bin/fish
```

Чтобы обратно переключиться на оболочку по умолчанию:
> Вышедший на замену `/bin/bash` с `/bin/tcsh` или `/bin/zsh` в соответствующих случаях.

```sh
chsh -s /bin/bash
```
