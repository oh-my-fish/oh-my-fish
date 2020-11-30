<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Packages

> Oh My Fish Documentation&nbsp;&bull;&nbsp;Also in
> <a href="../en-US/Packages.md">🇺🇸</a>
> <a href="../es-ES/Packages.md">🇪🇸</a>
> <a href="../nl-NL/Packages.md">🇳🇱</a>
> <a href="../pt-BR/Packages.md">🇧🇷</a>
> <a href="../uk-UA/Packages.md">🇺🇦</a>
> <a href="../zh-CN/Packages.md">🇨🇳</a>

<br>

# Создание

Чтобы научиться создавать пакеты, давайте создадим новый пакет, который будет выводить команду `hello_world` для вашей оболочки. Имена пакетов могут содержать только символы нижнего регистра и символ подчеркивания для разделения слов.

Oh My Fish может сгенерировать структуру пакета для вас. Используйте команду `omf new`:

```fish
$ omf new pkg hello_world
```

> Используйте `omf new theme my_theme_name` для тем.

Утилита изменяет текущий каталог на только что созданный пакет:

```
$ ls -l
  README.md
  hello_world.fish
  completions/hello_world.fish
```

Всегда описывайте, как работает ваш пакет в `README.md`. Также прочитайте больше об [автодополнении](http://fishshell.com/docs/current/commands.html#complete) и позаботьтесь о том, чтобы предоставить его для ваших утилит, когда это возможно.

`hello_world.fish` определяет одну функцию:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

Каждая функция в вашем пакете должна быть объявлена в своем собственном файле. Это требование механизма автозагрузки fish, который загружает функции по запросу, избегая загрузки ненужных функций.

Имейте в виду, что fish не имеет приватной области видимости, поэтому если вам необходимо разделить пакет на функции, добавьте такой префикс к функциям:
`__hello_world.my_extra_function`. Это поможет избежать совпадения имен и загрязнения глобального пространства имен.

# События

Пакеты были спроектированы так, чтобы использовать преимущества событий fish. На данный момент существует два события которые Oh My Fish будет передавать вашему пакету:

## Инициализация

Если вы хотите быть [уведомлены](http://fishshell.com/docs/current/commands.html#emit) когда ваш пакет загружается, объявите следующую функцию в вашем `hello_world.fish`:

```fish
function init -a path --on-event init_hello_world
  echo "hello_world initialized"
end
```

Используйте это событие, чтобы модифицировать окружение, загружать ресурсы, автоматически загружать функции и т.д. Если ваш пакет не экспортирует никаких функций, вы все равно можете использовать это событие для увеличения функциональности пакета.

## Удаление

Oh My Fish генерирует событие `uninstall_<pkg>` перед удалением пакета с помощью команды `omf remove <pkg>`. Подписчики могут использовать это событие, чтобы очистить кастомные ресурсы и т.д.

```fish
function uninstall --on-event uninstall_hello_world
end
```


# Сделайте его публичным

Oh My Fish хранит реестр публичных пакетов в `$OMF_PATH/db/`.

Чтобы добавить ваш пакет в реестр, введите в консоли:

```fish
# Для пакетов:
omf submit pkg/hello_world .../hello_world.git

# Для тем:
omf submit theme/my_theme .../my_theme_name.git
```

Это добавит новую сущность в ваш локальный реестр. Теперь вам просто надо [отправить нам PR][omf-pulls-link], чтобы обновить глобальный реестр.


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
