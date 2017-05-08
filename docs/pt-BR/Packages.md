<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Pacotes

> Documentação do Oh My Fish &nbsp;&bull;&nbsp;Also in
> <a href="../en-US/Packages.md">🇺🇸</a>
> <a href="../ru-RU/Packages.md">🇷🇺</a>
> <a href="../zh-CN/Packages.md">🇨🇳</a>
> <a href="../uk-UA/Packages.md">🇺🇦</a>

<br>

# Criando

Para aprender a criação de pacotes vamos criar um novo pacote que irá fornecer um comando `hello_world` para o seu shell. Os nomes de pacotes só podem conter letras minúsculas e hifens para separar palavras.

Oh My Fish pode criar uma estrutura padrão de um pacote para você. Use o comando `omf new`:

```fish
$ omf new pkg hello_world
```

> Use `omf new theme my_theme_name` para temas.

O utilitário altera o diretório atual para o pacote recém-criado:
```
$ ls -l
  README.md
  init.fish
  functions/hello_world.fish
  completions/hello_world.fish
```

>Sempre descreva como seu pacote trabalha em `README.md`.


>Também leia mais sobre [auto-complete](http://fishshell.com/docs/current/commands.html#complete) e tome cuidado para fornecê-lo para seus utilitários, quando aplicável.

`functions/hello_world.fish` define uma
simples função:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

Cada função no seu pacote deve ser declarada em seu próprio arquivo no diretório `functions`. Isso é exigido pelo mecanismo de carregamento automático do fish, que carrega funções sob demanda, evitando o carregamento de funções não utilizadas no momento da inicialização.

Tenha em mente que o fish não tem um escopo privado, portanto, se você precisa dividir seu pacote em funções, evite conflitos de nomes prefixando suas funções com algo único -- como o nome do pacote (por exemplo, hello_world_print_help). Para evitar poluir o namespace de comandos, considere prefixar as funções privadas com dois sublinhados (por exemplo, `__function_name_print_help`).

# Hooks

Oh My Fish fornece um sistema de "hooks" que permite que você escreva scripts para seu pacote que são executados quando ocorrem outros eventos interessantes. Os pacotes podem usar esses ganchos para fornecer instalação avançada, gerenciamento de recursos personalizados, etc. Os ganchos são scripts fish comuns, nomeados de acordo com o nome do evento pelo qual são acionados. A maioria dos hooks residem em um diretório `hooks` dentro do diretório do projeto de um pacote.

>Os Hooks que são chamados no momento da inicialização (`init.fish` e` key_bindings.fish`) podem desacelerar a inicialização do shell. Certifique-se de evitar o código lento no momento da inicialização! Além disso, se seu pacote não precisa de um arquivo de Hook, certifique-se de removê-lo.

O diretório de trabalho dentro de um Hook é sempre definido para o diretório raiz do pacote. Os Hooks Oh My Fish atualmente suportados estão listados abaixo:

## `init`

O hook `init` é executado uma vez quando o shell primeiro carrega. Os scripts para lidar com este hook devem estar localizados em `init.fish` no diretório raiz do pacote.

Dentro desse Hook, você pode acessar três variáveis relacionadas ao pacote:

* `$package`: Nome do pacote
* `$path`: Caminho de instalação do pacote
* `$dependencies`: Dependências do pacote

Por exemplo, com um script `init.fish` contendo o seguinte código:

```fish
echo "hello_world initialized"
```
Você verá a linha `hello_world initialized` no topo do terminal quando ele for aberto pela primeira vez.

Use esse Hook para modificar o ambiente, carregar recursos, funções de carregamento automático, etc. Se o pacote não exportar nenhuma função, você ainda pode usar esse evento para adicionar funcionalidade ao seu pacote ou criar dinamicamente funções.


## `key_bindings`

Se o seu pacote ou tema precisar usar teclas de atalho, certifique-se de configurá-los no gancho `key_bindings`. Os scripts de teclas de atalho devem estar localizados em `key_bindings.fish` no diretório raiz do pacote. Neste gancho, você pode usar livremente o comando [`bind`][fish-bind] para definir ligações de teclas personalizadas.

>Os temas também podem definir teclas de atalho! O Oh My Fish irá recarregar as teclas de atalho quando mudar de tema.

## `install`

O Hook `install` é acionado quando um pacote é instalado pela primeira vez. Os scripts para este gancho devem estar localizados em `hooks/install.fish`.

Dentro desse hook, você pode acessar duas variáveis relacionadas ao pacote:

* `$package`: Nome do pacote
* `$path`: Caminho de instalação do pacote

Este hook é útil para fazer o download de recursos adicionais, a criação de submódulos Git ou a instalação de dependências de terceiros, como os scripts Bash.


## `update`

Como você deve ter adivinhado, o gancho `update` é acionado para um pacote depois que ele é atualizado. Os scripts para este hook devem estar localizados em `hooks/update.fish`.

Dentro desse gancho, você pode acessar duas variáveis relacionadas ao pacote:

* `$package`: Nome do pacote
* `$path`: Caminho de instalação do pacote

Este hook é útil para atualizar submódulos Git ou verificar novas versões de dependências de terceiros.

## `uninstall`

O hook `uninstall` será acionado antes que um pacote seja removido via `omf remove <pkg>`. Os scripts para este hook devem estar localizados em `hooks/uninstall.fish`.

Dentro desse gancho, você pode acessar duas variáveis relacionadas ao pacote:

* `$package`: Nome do pacote
* `$path`: Caminho de instalação do pacote

Os pacotes podem usar este gancho para limpar recursos personalizados, etc.

> Nota: para compatibilidade com versões anteriores, os hooks de desinstalação também serão executados se estiverem localizados em `uninstall.fish` na raiz do pacote.

# Torná-lo público

O registro oficial de pacotes públicos é gerenciado no repositório [oh-my-fish/packages-main](https://github.com/oh-my-fish/packages-main). Consulte o README desse repositório para obter instruções sobre como adicionar seu pacote ao banco de dados oficial do pacote.


[fish-bind]: http://fishshell.com/docs/current/commands.html#bind
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
