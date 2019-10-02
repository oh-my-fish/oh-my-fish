<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> El _framework_ de <a href="http://fishshell.com">Fishshell</a> 

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE) [![Fish Shell Version](https://img.shields.io/badge/fish-≥v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)


Oh My Fish ofrece la infraestructura básica para permitirle instalar paquetes que extiendan o modifiquen el aspecto de su _shell_. Es rápido, extensible y
sencillo de utilizar.

> También disponible en&nbsp;
> <a href="../en-US/FAQ.md">🇺🇸</a>
> <a href="docs/ru-RU/README.md">🇷🇺</a>
> <a href="docs/zh-CN/README.md">🇨🇳</a>
> <a href="docs/uk-UA/README.md">🇺🇦</a>
> <a href="docs/pt-BR/README.md">🇧🇷</a>

<br>

## Índice de contenidos
* [Instalación](#instalación)
* [Comenzando (descripciones de los comandos)](#comenzando)
* [Avanzado](#avanzado)
  * [Inicio](#inicio)
  * [Archivos de configuración (Dotfiles)](#dotfiles)
* [Creando paquetes](#creando-paquetes)

## Instalación 

Puede comenzar de inmediate con la configuración predeterminada ejecutando lo siguiente en su terminal:

```fish
curl -L https://get.oh-my.fish | fish
```

Esto descargará el script instalador y comenzará la instalación. De manera alternativa, puede descargar el instalador y personalizar su instalación:

```fish
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

Puede verificar la integridad del instalador descargado comprobando el script con esta [suma de verificación](bin/install.sha256):

```
434264c56e3a7bb74733d9b293d72403c404e0a0bded3e632433d391d302504e  install
```

También puede insatalar Oh My Fish mediante Git o con un archivo tarball descargado desde la [página de publicaciones][releases]:

```fish
# with git
$ git clone https://github.com/oh-my-fish/oh-my-fish
$ cd oh-my-fish
$ bin/install --offline
# with a tarball
$ curl -L https://get.oh-my.fish > install
$ fish install --offline=omf.tar.gz
```

Ejecute `install --help` para obtener una lista completa de opciones de instalación que puede personalizar.

#### Requisitos

- **fish** shell, versión 2.2 o posterior
- **git**, versión 1.9.5 o posterior 

#### Problemas conocidos

- Debido a un error de regresión en fish 2.6 con algunos emuladores de terminal, los prompts a la derecha hace que la shell no se pueda utilizar.
  El tema OMF's `default` ofrece un prompt a la derecha, así que es necesario utilizar untema alternativo hasta que se publique una solción.
  (ver [#541](https://github.com/oh-my-fish/oh-my-fish/issues/541))


## Comenzando 

Oh My Fish incluye una pequeña utilidad `omf` para extraer e instalar nuevos paquetes y temas.

#### `omf update` _`[omf]`_ _`[<paquete>...]`_

Actualiza Oh My Fish, todos los paquetes de los repositorios y todos los paquetes instalados.

- Cuando es llamado sin argumentos, actualiza el núcleo y todos los paquetes instalados.
- Puede escoger actualizar sólo el núcleo, ejecutando `omf update omf`.
- Para una actualización selectiva de paquetes, escriba solo los paquetes que desea actualizar. Debería incluir "omf" en la lista para actualizar también el
  núcleo.

#### `omf install` _`[<nombre>|<url>]`_

Instala uno _o más_ paquetes.

- Puede instalar paquetes directamente con la URL mediante `omf install URL`
- Cuando es ejecutado sin argumentos, instala paquetes perdios desde [bundle](#dotfiles).

#### `omf repositories` _`[list|add|remove]`_

Gestiona los paquetes de los repositorios instalados por el usuario. Los paquetes de los repositorios son de donde los paquetes provienen utilizando
comandos como `omf install`. De manera predeterminada el [repositorio oficial](https://github.com/oh-my-fish/packages-main) está siempre instalado y
disponible.

#### `omf list`

Lista los paquetes instalados.

#### `omf theme` _`<tema>`_

Aplica un tema. Para listar los temas disponibles, escriba `omf theme`. También puede [previsualizar los temas disponibles](./docs/Themes.md) antes de
instalarlos.

#### `omf remove` _`<nombre>`_

Elimina un tema o paquete.

> Los paquetes pueden utilizar _hooks_ al desinstalarlos, así que una limpieza de recursos personalizado puede ejecutarse cuando se desinstalen. Ver
> [Desinstalar](/docs/es-ES/Packages.md#uninstall) para más información.

#### `omf reload`

Vuelve a cargar Oh My Fish y todos los complementos utilizando `exec` para reemplazar el proceso shell actual con uno nuevo.

> Este comando intenta ser lo más seguro posible, mitigando efectos colaterales cauados por `exec` y prevenir la recarga en el caso de procesos en segundo
> plano.

#### `omf new plugin | theme` _`<nombre>`_

Crea un esqueleto para un nuevo complemento o tema.

> Esto crea un nuevo directorio en `$OMF_CONFIG/{pkg | themes}/` con una plantilla.

#### `omf search` _`-t|--theme / -p|--package`_ _`<nombre>`_

Busca en la base de datos de Oh My Fish un paquete en concreto, tema o ambos. También soporta una búsqueda menos explícita, así que si no está seguro del
nombre simplemente ejecute `omf search simple`.

#### `omf channel`

Obtiene o cambia el canal de actualización.

De manera predeterminada existen dos canales: el canal `stable` ofrece actualizaciones estables con las versión más recientes de Oh My Fish, y `dev` que
ofrece los últimos cambios en desarrollo. El canal de actualización actual determina a qué versión de `omf update` se actualizará.

#### `omf doctor`

Utilizar para diagnosticar un error antes de [abrir un _issue_][omf-issues-new].

#### `omf destroy`

Desinstala Oh My Fish.

## Avanzado 

El instalador de Oh My Fish añade un fragmento a los archivos de configuración de fish del usuario (`~/.config/fish/conf.d/`) que llama al código de
arranque de OMF.

Tenga en cuenta que los scripts en ese directorio se ofrecen en el orden en el que el sistema de archivos los ve, y quizás puede ser necesario añadir un
prefijo a su script con números para ordenarlos.

Por ejemplo: `a_script.fish` tendrá preferencia sobre el fragmento `omf.fish`.
Así que si `a_script.fish` depende de complementos gestionados por OMF, considere renombrar el archivo del script a `xx_a_script.fish`.

De manera similar, para asegurarse que un script se ejecuta antes de `omf.fish`, debería añadirle el prefijo `00_`.
De manera alternativa también se puede utilizar `~/.config/omf/before.init.fish`.

### Startup

Every time you open a new shell, the startup code initializes Oh My Fish installation path and the _config_ path (`~/.config/omf` by default),
sourcing the [`init.fish`](init.fish) script afterwards, which autoloads packages, themes and your custom init files.

For more information check the [FAQ](docs/en-US/FAQ.md#what-does-oh-my-fish-do-exactly).

### Dotfiles

The `$OMF_CONFIG` directory represents the user state of Oh My Fish. It is the perfect
candidate for being added to your dotfiles and/or checked out to version control. There you can find three important files:

- __`theme`__ - The current theme
- __`bundle`__ - List of currently installed packages/themes
- __`channel`__ - The channel from which OMF gets updates (stable / dev)

And you may create and customize these special files:

- __`init.fish`__ - Custom script sourced after shell start
- __`before.init.fish`__ - Custom script sourced before shell start
- __`key_bindings.fish`__ - Custom key bindings where you can use the `bind` command freely

#### Setting variables in `init.fish`

One of the most common startup commands used in `init.fish` is variables definition. Quite likely, such variables need to be available in any shell session. To achieve this, define them globally. For example:

```fish
# Golang developers might need this one
set -xg GOPATH $HOME/gocode

# Python developers otherwise
set -xg PYTHONDONTWRITEBYTECODE 1
```

#### About the bundle

Every time a package/theme is installed or removed, the `bundle` file is updated. You can also edit it manually and run `omf install` afterwards to satisfy the changes. Please note that while packages/themes added to the bundle get automatically installed, a package/theme removed from bundle isn't removed from user installation.

#### Older fish versions

In fish 2.2, there is no `conf.d` directory, so the startup code has to be placed in the fish config file (`~/.config/fish/config.fish`).

It's highly recommended that your custom startup commands go into `init.fish` file instead of `~/.config/fish/config.fish`, as this allows you to keep the whole `$OMF_CONFIG` directory under version control.

If you need startup commands to be run *before* Oh My Fish begins loading plugins, place them in `before.init.fish` instead. If you're unsure, it is usually best to put things in `init.fish`.

## Creating Packages

Oh My Fish uses an advanced and well defined plugin architecture to ease plugin development, including init/uninstall hooks, function and completion autoloading. [See the packages documentation](docs/en-US/Packages.md) for more details.


[fishshell]: http://fishshell.com
[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
[releases]: https://github.com/oh-my-fish/oh-my-fish/releases
