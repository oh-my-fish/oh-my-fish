<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# FAQ

> La documentación de Oh My Fish&nbsp;&bull;&nbsp;También disponible en
> <a href="../en-US/FAQ.md">🇺🇸</a>
> <a href="../nl-NL/FAQ.md">🇳🇱</a>
> <a href="../pt-BR/FAQ.md">🇧🇷</a>
> <a href="../ru-RU/FAQ.md">🇷🇺</a>
> <a href="../uk-UA/FAQ.md">🇺🇦</a>
> <a href="../zh-CN/FAQ.md">🇨🇳</a>

<br>

Gracias por dedicar tiempo para leer este apartado de preguntas frecuentes (FAQ). Siéntete libre de crear un nuevo _issue_ si su pregunta no está respondida
en este documento.


## ¿Qué es Oh My Fish y por qué lo quiero?

Oh My Fish es un _framework_ para [Fishshell](http://fishshell.com/). Le ayudará a gestionar su configuración, los temas y paquetes.


## ¿Qué necesito conocer para utilizar Oh My Fish?

_Nada_. Puede instalar Oh My Fish y seguir utilizando Fish de manera normal. Cuando este listo para aprender más simplemente escriba en la línea de comandos `omf help`.


## ¿Qué son los paquetes Oh My Fish?

Los paquetes Oh My Fish son temas o complementos escritos en fish que expanden las funcionalidades principales de la _shell_, ejecutan código durante la
inicialización, añaden auto completado para las utilidades más conocidas, etc.


## ¿Qué tipos de paquetes Oh My Fish existen?

Existen aproximadamente 3 tipos de paquetes:

1. Utilidades de configuración. Por ejemplo [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv) comprueba si `pyenv` existe en su sistema y ejecuta
`(pyenv init - | psub)` por usted durante el arranque.

2. Temas. Echa un vistazo a nuestra [galería de temas](https://github.com/oh-my-fish).

3. Utilidades tradicionales para la _shell_. Por ejemplo [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy), una utilidad de portapapeles compatible con
sistemas Linux and OSX.


## ¿Qué hace Oh My Fish exactamente?

+ Ejecuta `$OMF_CONFIG/before.init.fish` si está disponible.

+ Carga de manera automática los paquetes y temas instalados en la ruta `$OMF_PATH/`.

+ Carga de manera automática su ruta de configuración. `~/.config/omf` de manera predeterminada, pero configurable mediante `$OMF_CONFIG`.

+ Carga de manera automática cualquier directorio `functions` de las rutas `$OMF_PATH` y `$OMF_CONFIG`

+ Ejecuta `$OMF_CONFIG/init.fish` si está disponible.


## ¿Cómo puedo actualizar una instalación de Oh My Fish ya existente?

> :warning: Recuerde realizar primero una copia de seguridad de sus archivos de configuración (o _dotfiles_) y otros datos importantes.

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

Ahora puede eliminar con seguridad `$fish_path`.

```fish
rm -rf "$fish_path"
```


## ¿Cómo utilizo fish como mi _shell_ predeterminada?

Añada Fish a `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

Haga que Fish sea su _shell_ predeterminada:

```sh
chsh -s /usr/local/bin/fish
```

Para volver a tener como predeterminada la _shell_ que utilizaba anteriormente:
> En el siguiente comando sustituya `/bin/bash` con `/bin/tcsh` o `/bin/zsh` según sea lo apropiado en su caso.

```sh
chsh -s /bin/bash
```
