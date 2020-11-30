<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Packages

> Oh My Fish Documentation&nbsp;&bull;&nbsp;Also in
> <a href="../en-US/Packages.md">🇺🇸</a>
> <a href="../es-ES/Packages.md">🇪🇸</a>
> <a href="../nl-NL/Packages.md">🇳🇱</a>
> <a href="../pt-BR/Packages.md">🇧🇷</a>
> <a href="../ru-RU/Packages.md">🇷🇺</a>
> <a href="../zh-CN/Packages.md">🇨🇳</a>

<br>

# Створення

Для того щоб навчитися створювати пакети, давайте створимо новий пакет, який буде виводити команду `hello_world` для вашей оболочки. Імена пакетів можуть містити лише символи нижнього регістру та символ підкреслення для розділення слів.

Oh My Fish може згенерувати структуру пакету для вас. Використовуйте команду `omf new`:

```fish
$ omf new pkg hello_world
```

> Використовуйте `omf new theme my_theme_name` для тем.

Утиліта змінює поточну директорію на щойно створений пакет:

```
$ ls -l
  README.md
  hello_world.fish
  completions/hello_world.fish
```

Завжди описуйте, як працює Ваш пакет в `README.md`. Також почитайте більше про [автодоповнення](http://fishshell.com/docs/current/commands.html#complete) і потурбуйтесь про те, щоб надати його для ваших утиліт, коли це можливо.

`hello_world.fish` визначає одну функцію:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

кожна функція у вашому пакеті повинна бути оголошена в своєму власному файлі. Це вимога механізму автозавантаження fish, який завантажує функції за запитом, уникаючи, таким чином, завантаження непотрібних функцій.

Майте на увазі, що fish не має приватної області видимості, тому якщо вам необхідно розділити пакет на функції, додайте подібний префікс до функцій:
`__hello_world.my_extra_function`. Це допоможе уникнути співпадіння імен та забруднення глобального простору імен.

# Події

Пакети були спроектовані так, щоб використовувати переваги подій fish. На поточний момент існує дві події які Oh My Fish буде передавати вашому пакету:

## Ініціалізація

Якщо ви хочете бути [попереджені](http://fishshell.com/docs/current/commands.html#emit) коли ваш пакет завантажується, оголосіть наступну функцію у вашому `hello_world.fish`:

```fish
function init -a path --on-event init_hello_world
  echo "hello_world initialized"
end
```

Використовуйте цю подію, щоб модифікувати оточення, завантажувати ресурси, автоматично завантажувати функції і т.д. Якщо ваш пакет не експортує ніяких функцій, ви все одно можете використовувати цю подію для розширення функціональності пакету.

## Видалення

Oh My Fish генерує подію `uninstall_<pkg>` перед видаленням пакету з допомогою команди `omf remove <pkg>`. Підписники можуть використовувати цю подію, для очищення кастомних ресурсів, тощо.

```fish
function uninstall --on-event uninstall_hello_world
end
```


# Зробіть його публічним

Oh My Fish зберігає реєстр публічних пакетів у `$OMF_PATH/db/`.

Для того щоб додати ваш пакет у реєстр, введіть в консолі:

```fish
# Для пакетів:
omf submit pkg/hello_world .../hello_world.git

# Для тем:
omf submit theme/my_theme .../my_theme_name.git
```

Це додасть нову сутність у ваш локальный реєстр. Тепер вам просто потрібно [надіслати нам PR][omf-pulls-link], щоб оновити глобальний реєстр.


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
