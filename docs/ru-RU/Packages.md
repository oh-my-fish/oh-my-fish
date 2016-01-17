<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <a href="../en-US/Packages.md">English</a> &bull;
  <a href="../zh-CN/Packages.md">简体中文</a> &bull;
  <b>Русский</b>
</p>

# Создание

Чтобы научиться создавать пакеты давайте создадим новый пакет который будет выводить команду `hello_world` для Вашей оболочки. Имена пакетов могут содержать только символы нижнего регистра и символ подчеркивания для разделения слов.

Oh My Fish может сгенерировать структуру пакета для Вас. Используйте команду `omf new`:

```fish
$ omf new pkg hello_world
```

> Используйте `omf new theme my_theme_name` для тем.

Утилита изменяет текущий каталог на только что созданыый пакет:

```
$ ls -l
  README.md
  hello_world.fish
  completions/hello_world.fish
```

Всегда описывайте как работает ваш пакет в `README.md`. Также прочитайте больше о [автодополнении](http://fishshell.com/docs/current/commands.html#complete) а также позаботьтесь о том чтобы предоставить его для ваших утилит, когда это возможно.

`hello_world.fish` определяет одну функцию:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

Каждая функция в Вашем пакете должна быть объявлена в своем собственном файле. Это требование механизма автозагрузки fish, который загружает функции по запросу, избегая загрузки ненужных функций.

Имейте в виду что fish не имеет приватной области видимости, поэтому если Вам необходимо разделить Ваш пакет на функции, добавьте префикс к Вашим функциям как здесь:
`__hello_world.my_extra_function`, чтобы избежать совпадения имен и загрязнения глобального пространства имен.

# События

Пакеты были спроектированы так, чтобы использовать преимущества событий fish. На данный момент существует два события которые Oh My Fish будет передавать Вашему пакету:

## Инициализация

Если вы хотите быть [уведомлены](http://fishshell.com/docs/current/commands.html#emit) когда Ваш пакет загружается, объявите следующую функцию в Вашем `hello_world.fish`:

```fish
function init -a path --on-event init_hello_world
  echo "hello_world initialized"
end
```

Используйте это событие чтобы модифицировать окружение, загружать ресурсы, автоматически загружать функции и тд. Если Ваш пакет не экспортирует никаких функций, Вы все равно можете использовать это событие чтобы добавить функциональность в Ваш пакет.

## Удаление

Oh My Fish генерирует `uninstall_<pkg>` события перед тем как пакет удален с помощью команды `omf remove <pkg>`. Подписчики могут использовать это событие чтобы очистить кастомные ресурсы и тд.

```fish
function uninstall --on-event uninstall_hello_world
end
```


# Сделайте его публичным

Oh My Fish хранит реестр публичных пакетов в `$OMF_PATH/db/`.

Чтобы добавить Ваш пакет в реестр вам необходимо:
To add your package to the registry you need to:

```fish
# Для пакетов:
omf submit pkg/hello_world .../hello_world.git

# Для тем
omf submit theme/my_theme .../my_theme_name.git
```

Это добавит новую сущность в ваш локальный реестр. Теперь Вам просто надо [отправить нам PR][omf-pulls-link] чтобы обновить глобальный реестр.


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
