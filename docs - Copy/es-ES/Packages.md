<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Paquetes 

> La documentación de Oh My Fish&nbsp;&bull;&nbsp;También disponible en
> <a href="../en-US/Packages.md">🇺🇸</a>
> <a href="../nl-NL/Packages.md">🇳🇱</a>
> <a href="../pt-BR/Packages.md">🇧🇷</a>
> <a href="../ru-RU/Packages.md">🇷🇺</a>
> <a href="../uk-UA/Packages.md">🇺🇦</a>
> <a href="../zh-CN/Packages.md">🇨🇳</a>

<br>

# Creando

Para aprender en la creación de paquetes, vamos a crear un nuevo paquete que mostrará un comando `hello_world` para su _shell_. Los nombres de los paquetes
solo pueden contener letras minúsculas y guiones para separar palabras.

Oh My Fish puede crear el esqueleto de una estructura de un paquete para usted. Para ello utilice el comando `omf new`:

```fish
$ omf new plugin hello_world
```

> Utilice `omf new theme my_theme_name` para crear un nuevo tema.

La utilidad cambia el directorio actual al paquete recién creado:

```
$ ls -l
  README.md
  init.fish
  functions/hello_world.fish
  completions/hello_world.fish
```

>Proporcione siempre una descripción de cómo funciona su paquete en un archivo `README.md`.


>Lea más sobre [auto completado](http://fishshell.com/docs/current/commands.html#complete) y tenga en cuenta el incluirlo para sus utilidades cuando sea
>aplicable.

`functions/hello_world.fish` define una única función:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

Cada función en su paquete debe ser declarada en su propio archivo en el directorio `functions`. Esto es necesario para el mecanismo de carga automática de
fish, que carga funciones bajo demanda, evitando funciones no utilizadas durante el tiempo de arranque.

Tenga en cuenta que fish no tiene un ámbito privado, así que si necesita dividir su paquete en funciones, evite conflictos de nombres utilizando como
prefijo de las funciones algo único, como el nombre dle paquete (por ejemplo: `hello_world_print_help`). Para evitar el contaminado de nombres de comandos,
considere utilizar como prefijo de funciones privadas dos guiones bajos (e.g. `__function_name_print_help`).

# Hooks

Oh My Fish ofrece un sistema de "hooks" que le permite escribir scripts para su paquete que son ejecutados cuando ocurre otro evento interesante. Los
paquetes puede utilizar estos _hooks_ para ofrecer una instalación avanzada, una gestión de recursos personalizada, etc. Los _hooks_ son scripts normales de
Fish nombrados después del evento por el que son lanzados. La mayoría de _hooks_ se encuentran en un directorio `hooks` dentro del directorio del proyecto
del paquete.

>Los _hooks_ que son llamados después del tiempo de arranque (`init.fish` y `key_bindings.fish`) pueden ralentizar el arranque de la _shell_. ¡Asegúrese de
>evitar utilizar código lento en el proceso de arranque! También, si su paquete no necesita de un archivo hook, asegúrese de eliminarlo.

El directorio de trabajo dentro de un hook está siempre establecido en la raíz del directorio del paquete. Los hooks Oh My Fish actualmente admitidos están
listados a continuación:

## `init`

El hook `init` se ejecuta la primera vez que la shell se carga. Los scripts que utilicen este hook deberían estar ubicados en `init.fish` en la raíz del
directorio del paquete.

Dentro de este hook, puede acceder a tres variables relacionadas con el paquete:

* `$package`: Nombre del paquete
* `$path`: Ruta de instalación del paquete
* `$dependencies`: Dependencias del paquete

Por ejemplo, con un script `init.fish` que contenga el siguiente código:

```fish
echo "hello_world initialized"
```

verá la línea `hello_world initialized` en la parte superior de la terminal cuando sea abierta por primera vez.

Utilice este hook para modificar el entorno, cargar recursos, cargar de manera automática funciones, etc. Si su paquete no exporta ninguna función, todavía
puede utilizar este evento para añadir funcionalidades a su paquete, o de manera dinámica crear funciones.

## `key_bindings`

Si su paquete o sistema utiliza atajos de teclado, asegúrese de establecerlos en el hook `key_bindings`. El script del atajo de teclado debe estar ubicado
en `key_bindings.fish` en la raíz  del directorio del paquete. En este hook puede utilizar libremente el comando [`bind`][fish-bind] para definir los atajos
de teclado personalizados.

>¡Los temas también pueden definir atajos de teclado! Oh My Fish volverá a cargar los atajos de teclado cuando cambie entre los temas.

## `install`

El hook `install` es lanzado cuando un paquete es instalado por primera vez. Los scripts para este hook deberán estar ubicados en `hooks/install.fish`.

Dentro de este hook, puede acceder a dos variables relacionadas con el paquete:

* `$package`: Nombre del paquete
* `$path`: Ruta de instalación del paquete

Este hook es útil para descargar recursos adicionales, configurar submódulos de Git o instalar dependencias de terceros como scripts de Bash.

## `update`

Como puede haber adivinado, el hook `update` es lanzado por un paquete después de haber sido actualizado. Los scripts para este hook deberán estar ubicados en `hooks/update.fish`.

Dentro de este hook, puede acceder a dos variables relacionadas con el paquete:

* `$package`: Nombre del paquete
* `$path`: Ruta de instalación del paquete

Este hook es útil para actualizar submódulos de Git o para comprobar si existen nuevas versiones para dependencias de terceros.

## `uninstall`

El hook `uninstall` será lanzado antes de que un paquete sea eliminado mediante `omf remove <pkg>`. Los scripts para este hook deberán estar ubicados en `hooks/uninstall.fish`.

Dentro de este hook, puede acceder a dos variables relacionadas con el paquete:

* `$package`: Nombre del paquete
* `$path`: Ruta de instalación del paquete

Los paquetes pueden utilizar este hook para limpiar recursos personalizados, etc.

> Nota: para mantener la compatibilidad con versiones anteriores, los hooks uninstall también serán ejecutados si están ubicados en `uninstall.fish` en la
> raíz del paquete.

# Hágalo público

El registro oficial de paquetes públicos es gestionado en el repositorio [oh-my-fish/packages-main](https://github.com/oh-my-fish/packages-main). Vea el
archivo README de ese repositorio para encontrar instrucciones de cómo añadir su paquete a la base de datos oficial de paquetes.


[fish-bind]: http://fishshell.com/docs/current/commands.html#bind
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
