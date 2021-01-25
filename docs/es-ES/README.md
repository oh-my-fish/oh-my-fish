<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> El _framework_ de <a href="http://fishshell.com">Fishshell</a>

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE) [![Fish Shell Version](https://img.shields.io/badge/fish-≥v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)


Oh My Fish ofrece la infraestructura básica para permitirle instalar paquetes que extiendan o modifiquen el aspecto de su _shell_. Es rápido, extensible y
sencillo de utilizar.

> También disponible en&nbsp;
> <a href="../../README.md">🇺🇸</a>
> <a href="../nl-NL/README.md">🇳🇱</a>
> <a href="../pt-BR/README.md">🇧🇷</a>
> <a href="../ru-RU/README.md">🇷🇺</a>
> <a href="../uk-UA/README.md">🇺🇦</a>
> <a href="../zh-CN/README.md">🇨🇳</a>

<br>

## Índice de contenidos
* [Instalación](#instalación)
* [Comenzando (descripciones de los comandos)](#comenzando)
* [Avanzado](#avanzado)
  * [Inicio](#inicio)
  * [Archivos de configuración (Dotfiles)](#archivos-de-configuraci%C3%B3n-dotfiles)
* [Creando paquetes](#creando-paquetes)

## Instalación

Puede comenzar de inmediato con la configuración predeterminada ejecutando lo siguiente en su terminal:

```fish
curl -L https://get.oh-my.fish | fish
```

Esto descargará el script instalador y comenzará la instalación. De manera alternativa, puede descargar el instalador y personalizar su instalación:

```fish
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

Puede verificar la integridad del instalador descargado comprobando el script con esta [suma de verificación](/bin/install.sha256):

```
bb1f4025934600ea6feef2ec11660e17e2b6449c5a23c033860aed712ad328c9  install
```

También puede insatalar Oh My Fish mediante Git o con un archivo tarball descargado desde la [página de publicaciones][/releases]:

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

- Debido a un error de regresión en fish 2.6 con algunos emuladores de terminal, los prompts a la derecha hacen que la shell no se pueda utilizar.
  El tema OMF's `default` ofrece un prompt a la derecha, así que es necesario utilizar un tema alternativo hasta que se publique una solución.
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
- Cuando es ejecutado sin argumentos, instala paquetes faltantes desde [bundle](#archivos-de-configuraci%C3%B3n-dotfiles).

#### `omf repositories` _`[list|add|remove]`_

Gestiona los paquetes de los repositorios instalados por el usuario. Los paquetes de los repositorios son de donde los paquetes provienen utilizando
comandos como `omf install`. De manera predeterminada el [repositorio oficial](https://github.com/oh-my-fish/packages-main) está siempre instalado y
disponible.

#### `omf list`

Lista los paquetes instalados.

#### `omf theme` _`<tema>`_

Aplica un tema. Para listar los temas disponibles, escriba `omf theme`. También puede [previsualizar los temas disponibles](../Themes.md) antes de
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

### Inicio

Cada vez que abre una nueva shell, el código de inicio inicializa la ruta de instalación y la ruta de configuración de Oh My Fish (`~/.config/omf` de manera
predeterminada), ejecutando el script [`init.fish`](/init.fish) posteriormente, que carga de manera automática los paquetes, temas y sus ficheros
personalizados de inicio.

Para más información puede consultar la sección de preguntas frecuentes [FAQ](FAQ.md#qué-hace-oh-my-fish-exactamente).

### Archivos de configuración (Dotfiles)

El directorio `$OMF_CONFIG` representa el estado del usuario de Oh My Fish. Es el perfecto candidato para ser añadido a sus archivos de configuración o
_dotfiles_ y/o añadirlo a un control de versiones como puede ser Git. Allí se pueden encontrar tres archivos importantes:

- __`theme`__ - El tema actual
- __`bundle`__ - Lista de los temas/paquetes actualmente instalados
- __`channel`__ - El canal desde el cual OMF descarga las actualizaciones (estable / dev)

Y puede crear o personalizar esos archivos especiales:

- __`init.fish`__ - Script personalizado que se ejecuta después del arranque de la shell
- __`before.init.fish`__ - Script personalizado que se ejecuta antes del arranque de la shell
- __`key_bindings.fish`__ - Atajos de teclado personalizados donde puede utilizar el comando `bind` de manera libre

#### Configurando variables en `init.fish`

Uno de los usos más comunes utilizados en `init.fish` es la definición de variables. Seguramente, para variables que necesitan estar disponible en cualquier
sesión de la shell. Para conseguir esto, es necesario definirlas de manera global. Por ejemplo:

```fish
# Los desarrolladore de Golang quizás necesitan esto
set -xg GOPATH $HOME/gocode

# En cambio los desarrolladores de Python
set -xg PYTHONDONTWRITEBYTECODE 1
```

#### Acerca de bundle

Cada vez que un paquete/tema es instalado o eliminado, el archivo `bundle` es actualizado. También puedes editarlo manualmente y después ejecutar `omf
install` para tomar en cuenta los cambios realizados. Por favor tenga en cuenta que mientras que los paquetes/temas añadidos a _bundle_ son
instalados automáticamente, un paquete/tema eliminado de _bundle_ no es eliminado de la instalación del usuario.

#### Versiones antiguas de fish

En fish 2.2, no existe el directorio `conf.d`, así que el código de inicio tiene que ser ubicado en el archivo de configuración de fish (`~/.config/fish/config.fish`).

Es altamente recomendado que los comandos personalizados de inicio estén en el archivo `init.fish` en vez de en `~/.config/fish/config.fish`, ya que esto le
permite mantener todo el directorio `$OMF_CONFIG` bajo un servicio de control de versiones.

Si necesita ejecutar comandos de inicio que sean ejecutados *antes* de que Oh My Fish comience a cargar complementos, ubiquelos en `before.init.fish`. Si no
está seguro, normalmente es mejor poner las cosas en `init.fish`.

## Creando paquetes

Oh My Fish utiliza una avanzada y bien definida arquitectura de desarrollo de complementos, incluyendo _hooks_ de inicialización/instalación, carga
automática de funciones. [Ver la documentación de paquetes](Packages.md) para más detalles.


[fishshell]: http://fishshell.com
[colaboradores]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
[publicaciones]: https://github.com/oh-my-fish/oh-my-fish/releases
