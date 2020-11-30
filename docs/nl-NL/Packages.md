<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Pakketten

> Oh My Fish-documentatie&nbsp;&bull;&nbsp;Ook beschikbaar in het
> <a href="../en-US/Packages.md">🇺🇸</a>
> <a href="../es-ES/Packages.md">🇪🇸</a>
> <a href="../pt-BR/Packages.md">🇧🇷</a>
> <a href="../ru-RU/Packages.md">🇷🇺</a>
> <a href="../uk-UA/Packages.md">🇺🇦</a>
> <a href="../zh-CN/Packages.md">🇨🇳</a>

<br>

# Maken

Om pakketten te leren maken, gaat u een nieuw pakket volgens een sjabloon maken. Dit pakket bevat een `hello_world`-opdracht voor uw shell. Pakketnamen mogen alleen kleine letters en streepjes bevatten.

Oh My Fish kan een pakketstructuur voor u samenstellen. Gebruik hiervoor `omf new`:

```fish
$ omf new plugin hello_world
```

> Voer `omf new theme my_theme_name` uit om thema's te maken.

Er wordt overgeschakeld van de huidige map naar die van het pakket:

```
$ ls -l
  README.md
  init.fish
  functions/hello_world.fish
  completions/hello_world.fish
```

>Omschrijf altijd in `README.md` hoe uw pakket werkt.


>Lees meer over [automatisch aanvullen](http://fishshell.com/docs/current/commands.html#complete) en gebruik het zorgvuldig.

`functions/hello_world.fish` omvat een enkele functie:

```fish
function hello_world -d "Toont hallo wereld"
  echo "Hallo wereld!"
end
```

Elke functie in uw pakket dient te worden verklaard in een bestand in elke `functions`-map. Fish vereist dit voor het automatisch laden, welke functies op afroep laadt, zodat ongebruikte functies niet worden geladen.

Let op: Fish bevat geen private scope, dus als u uw pakket moet splitsen in functies, voorkom dan dubbele namen door een aanduiding te gebruiken, zoals uw pakketnaam (bijv. `hello_world_print_help`). Om de opdrachtnamespace niet te bezaaien met onnodige functies, kunt u privéfuncties aanduiden met twee onderliggende streepjes (bijv. `__function_name_print_help`).

# Hooks

Oh My Fish bevat een 'hooks'-systeem waarmee u scripts kunt maken voor uw pakket die worden uitgevoerd als andere gebeurtenissen plaatsvinden. Pakketten kunnen deze hooks gebruiken om geavanceerde installatie te bieden, aangepaste bronnen, etc. Hooks zijn eigenlijk Fish-scripts die genoemd zijn naar de gebeurtenis die ze aanroepen. De meeste hooks staan in een `hooks`-map in de projectmap van het pakket.

>Hooks die worden aangeroepen tijdens het opstarten (`init.fish` en `key_bindings.fish`) kunnen het starten van de shell vertragen. Voorkom dus langzame code tijdens het starten! Als uw pakket geen hook nodig heeft, verwijder dan het bestand.

De werkmap in een hook is altijd ingesteld op de hoofdmap van het pakket. De momenteel door Oh My Fish ondersteunde hooks staan hieronder:

## `init`

De `init`-hook wordt uitgevoerd tijdens het starten van de shell. Scripts die deze hook aanroepen dienen te worden geplaatst in `init.fish` in de hoofdmap van het pakket.

Binnen deze hook heeft u toegang tot drie gerelateerde variabelen:

* `$package`: pakketnaam
* `$path`: pakketinstallatiepad
* `$dependencies`: pakketafhankelijkheden

Voorbeeld: met een `init.fish`-script die de code

```fish
echo "hello_world initialized"
```

bevat, ziet u de regel `hello_world is geïnitialiseerd` bovenaan het terminalvenster als de shell net is gestart.

Gebruik deze hook om de omgeving aan te passen, bronnen te laden, functies automatisch te laden, etc. Als uw pakket geen functie aanroept, kunt u hiermee functionaliteit toevoegen aan uw pakket of dynamische functies samenstellen.

## `key_bindings`

Als uw pakket of thema sneltoetsen gebruikt, stel deze dan in in de `key_bindings`-hook. Sneltoetsscripts dienen geplaatst te worden in `key_bindings.fish` in de hoofdmap van het pakket. Binnen deze hook kunt u de [`bind`][fish-bind]-opdracht vrij gebruiken om aangepaste sneltoetsen in te stellen.

>Thema's kunnen ook sneltoetsen bevatten! Oh My Fish herlaadt de sneltoetsen als u overschakelt naar een ander thema.

## `install`

De `install`-hook wordt aangeroepen als een pakket voor het eerst wordt geïnstalleerd. Scripts die deze hook gebruiken dienen te worden geplaatst in `hooks/install.fish`.

Binnen deze hook heeft u toegang tot twee gerelateerde variabelen:

* `$package`: pakketnaam
* `$path`: pakketinstallatiepad

Deze hook is handig voor het downloaden van aanvullende bronnen, instellen van Git-submodules of het installeren van externe afhankelijkheden, zoals Bash-scripts.

## `update`

Zoals de naam doet vermoeden wordt de `update`-hook aangeroepen nadat een pakket is bijgewerkt. Scripts die deze hook gebruiken dienen te worden geplaatst in `hooks/update.fish`.

Binnen deze hook heeft u toegang tot twee gerelateerde variabelen:

* `$package`: pakketnaam
* `$path`: pakketinstallatiepad

Deze hook is handig voor het bijwerken van Git-submodules of controleren op nieuwe versies van externe afhankelijkheden.

## `uninstall`

De `uninstall`-hook wordt aangeroepen vlak voordat een pakket wordt verwijderd middels `omf remove <pkg>`. Scripts die deze hook gebruiken dienen te worden geplaatst in `hooks/uninstall.fish`.

Binnen deze hook heeft u toegang tot twee gerelateerde variabelen:

* `$package`: pakketnaam
* `$path`: pakketinstallatiepad

Pakketten kunnen deze hook gebruiken om aangepaste bronnen te wissen of anderzijds op te schonen.

> Let op: omwille van achterwaartse compatibiliteit worden uninstall-hooks ook aangeroepen door `uninstall.fish` in de hoofdmap van het pakket.

# Delen

Het officiële register met openbare pakketten wordt beheerd in de [oh-my-fish/packages-main](https://github.com/oh-my-fish/packages-main)-pakketbron. Neem de README van die pakketbron door om te zien hoe u uw pakket kunt toevoegen.


[fish-bind]: http://fishshell.com/docs/current/commands.html#bind
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
