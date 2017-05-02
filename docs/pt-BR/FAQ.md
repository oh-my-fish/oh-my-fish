<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# FAQ

> Documentação do Oh My Fish &nbsp;&bull;&nbsp;Also in
> <a href="../en-US/FAQ.md">🇺🇸</a>
> <a href="../ru-RU/FAQ.md">🇷🇺</a>
> <a href="../zh-CN/FAQ.md">🇨🇳</a>
> <a href="../uk-UA/FAQ.md">🇺🇦</a>

<br>

Obrigado por dedicar algum tempo para ler este FAQ. Sinta-se livre para criar um nova issue se sua pergunta não for respondida aqui.


## O que é Oh My Fish e por que eu quero isso?

Oh My Fish é um _framework_ para o [Fishshell](http://fishshell.com/). Ele ajuda você a gerenciar sua configuração, temas e pacotes.


## O que eu preciso saber para usar o Oh My Fish?

_Nada_. Você pode instalar o Oh My Fish e manter usando o Fish normalmente. Quando estiver pronto para aprender mais apenas digite `omf help`.


## O que são os pacotes Oh My Fish?

Os pacotes Oh My Fish são temas ou plugins escritos em fish que estendem as funcionalidades do shell, executando códigos durante a inicialização, adicionando auto-complete para funcionalidades conhecidas, etc.


## Quais os tipos de pacotes do Oh My Fish?

Há aproximadamente 3 tipos de pacotes:

1. Utilitários de configuração. Por exemplo, [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv) verifica se` pyenv` existe no seu sistema e executa `(pyenv init - | psub)` para você durante a inicialização.

2. Temas. Confira nossa [galeria de temas](https://github.com/oh-my-fish).

3. Utilitários shell tradicionais. Por exemplo [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy), um utilitário de área de transferência compatível entre Linux e OSX.

## O que exatamente o Oh My Fish faz?

+ Executa `$OMF_CONFIG/before.init.fish` se disponível.

+ Carregamento automático de pacotes e temas instalados em `$OMF_PATH/`.

+ Carregamento automático suas configurações. `~/.config/omf` por padrão, mas configurável via `$OMF_CONFIG`.

+ Carregamento automático de quaisquer `functions` armazenadas em `$OMF_PATH` e `$OMF_CONFIG`

+ Executa `$OMF_CONFIG/init.fish` se disponível.


## Como eu posso atualizar uma instalação existente do Oh My Fish?

> :warning: Lembre de fazer um backup de seus dotfiles e de outros dados importantes.

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

Agora você pode remover com segurança o `$fish_path`.

```fish
rm -rf "$fish_path"
```


## Como eu uso o fish como meu shell padrão?

Adicione Fish ao `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

Faça Fish seu shell padrão:

```sh
chsh -s /usr/local/bin/fish
```

Para alterar seu shell padrão de volta:
> Substitua `/bin/bash` com `/bin/tcsh` ou `/bin/zsh` como desejar.

```sh
chsh -s /bin/bash
```
