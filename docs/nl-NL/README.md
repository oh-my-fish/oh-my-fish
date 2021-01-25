<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> Het <a href="http://fishshell.com">Fish-shell</a> framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE) [![Fish Shell Version](https://img.shields.io/badge/fish-≥v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)


Oh My Fish biedt kerninfrastructuur zodat u pakketten kunt installeren om uw shell uit te breiden of aan te passen. Het is snel, uitbreidbaar en eenvoudig te gebruiken.

> Ook beschikbaar in het&nbsp;
> <a href="../../README.md">🇺🇸</a>
> <a href="../es-ES/README.md">🇪🇸</a>
> <a href="../pt-BR/README.md">🇧🇷</a>
> <a href="../ru-RU/README.md">🇷🇺</a>
> <a href="../uk-UA/README.md">🇺🇦</a>
> <a href="../zh-CN/README.md">🇨🇳</a>

<br>

## Inhoudsopgave
* [Installatie](#installatie)
* [Aan de slag (uitleg omtrent opdrachten)](#aan-de-slag)
* [Geavanceerd](#geavanceerd)
  * [Opstarten](#opstarten)
  * [Puntbestanden](#puntbestanden)
* [Pakketten maken](#pakketten-maken)

## Installatie

U kunt direct aan de slag door deze opdracht uit te voeren in een terminalvenster:

```fish
curl -L https://get.oh-my.fish | fish
```

Hiermee downloadt u het installatiescript en voert u de standaardinstallatie uit. Indien gewenst kunt u het installatiescript downloaden en aanvullende opties opgeven:

```fish
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

U kunt de integriteit van het installatiescript verifiëren met [deze controlesom](/bin/install.sha256):

```
bb1f4025934600ea6feef2ec11660e17e2b6449c5a23c033860aed712ad328c9 install
```

Ook kunt u Oh My Fish installeren middels Git of een offline-brontarball van de [uitgavenpagina][releases]:

```fish
# middels git
$ git clone https://github.com/oh-my-fish/oh-my-fish
$ cd oh-my-fish
$ bin/install --offline
# middels een tarball
$ curl -L https://get.oh-my.fish > install
$ fish install --offline=omf.tar.gz
```

Voer `install --help` uit om een volledige lijst met installatieopties te bekijken.

#### Vereisten

- **fish**-shell, versie 2.2 of hoger
- **git**, versie 1.9.5 of hoger

#### Gemelde problemen

- Door een bug in Fish 2.6 in sommige terminalemulators zijn opdrachtregels aan de rechterkant momenteel onbruikbaar.
  OMF's `standaard`thema maakt hier gebruik van, dus raden wij aan een alternatief thema te gebruiken tot het probleem is opgelost.
  (zie [#541](https://github.com/oh-my-fish/oh-my-fish/issues/541))


## Aan de slag

Oh My Fish bevat het hulpprogramma `omf` om pakketten en thema's op te halen en te installeren.

#### `omf update` _`[omf]`_ _`[<package>...]`_

Werk Oh My Fish, alle pakketbronnen en geïnstalleerde pakketten bij.

- Zonder opdrachtregelopties worden de kern en alle geïnstalleerde pakketten bijgewerkt.
- Voer `omf update omf` uit om alleen de kern bij te werken.
- Geef pakketnamen op om alleen specifieke pakketten bij te werken. U kunt hieraan desgewenst "omf" toevoegen om ook de kern bij te werken.

#### `omf install` _`[<name>|<url>]`_

Installeer één _of meerdere_ pakketten.

- U kunt pakketten installeren door een url op te geven met `omf install url`
- Zonder opdrachtregelopties worden alleen ontbrekende pakketten geïnstalleerd uit de [bundel](#puntbestanden).

#### `omf repositories` _`[list|add|remove]`_

Beheer eigen toegevoegde pakketbronnen. Pakketbronnen bevatten de pakketten die kunnen worden geïnstalleerd met `omf install`. Standaard is alleen de [officiële pakketbron](https://github.com/oh-my-fish/packages-main) beschikbaar.

#### `omf list`

Toon alle geïnstalleerde pakketten.

#### `omf theme` _`<theme>`_

Pas een thema toe. Bekijk alle beschikbare thema's met `omf theme`. U kunt ze ook [voorvertonen](/docs/Themes.md).

#### `omf remove` _`<name>`_

Verwijder een thema of pakket.

> Pakketten kunnen deïnstallatieopties bevatten zodat er aangepaste opschoning kan plaatsvinden. Lees voor meer informatie [Deïnstalleren](/docs/nl-NL/Packages.md#uninstall).

#### `omf reload`

Herlaad Oh My Fish en alle plug-ins door `exec` uit te voeren om alle huidige shellprocessen te vervangen door een nieuw proces.

> Deze opdracht probeert zo veilig mogelijk te werk te gaan en bijwerkingen van `exec` te voorkomen.

#### `omf new plugin | theme` _`<name>`_

Maak een nieuwe plug-in of nieuw thema.

> Hiermee maakt u een nieuwe map `$OMF_CONFIG/{pkg | themes}/` aan met een sjabloon.

#### `omf search` _`-t|--theme / -p|--package`_ _`<name>`_

Zoek een specifiek pakket, thema of beide in Oh My Fish's databank. Als u de naam niet kent, is eenvoudig zoeken mogelijk met `omf search simple`.

#### `omf channel`

Toon of wijzig het updatekanaal.

Standaard zijn er twee kanalen beschikbaar: `stable`, welke stabiele updates aanbiedt op basis van de nieuwste tag en `dev`, welke updates aanbiedt met de allernieuwste code die vaak nog in ontwikkeling is. Het ingestelde updatekanaal bepaalt welke versie `omf update` installeert.

#### `omf doctor`

Voer dit uit om foutopsporingsinformatie vast te leggen voor [een 'issue'][omf-issues-new].

#### `omf destroy`

Deïnstalleer Oh My Fish.

## Geavanceerd

Het Oh My Fish-installatiescript voegt een knipsel toe aan de Fish-configuratiebestanden (`~/.config/fish/conf.d/`) dat OMF's opstartcode aanroept.

Let op: de scripts in bovenstaande map worden uitgevoerd op basis van de volgorde die het bestandssysteem aanhoudt,
dus kan het nuttig zijn scriptbestanden aan te duiden met een getal.

Voorbeeld: `a_script.fish` geniet de voorkeur boven het `omf.fish`-knipsel.
Dus als `a_script.fish` afhankelijk is van door OMF beheerde plug-ins, is het raadzaam om de naam van het scriptbestand te wijzigen in `xx_a_script.fish`.

Als een script moet worden uitgevoerd voordat `omf.fish` wordt aangeroepen, kunt u het aanduiden met `00_`.
Ook kunt u `~/.config/omf/before.init.fish` hiervoor gebruiken.

### Opstarten

Telkens als u een nieuwe shell opent, initialiseert de opstartcode het Oh My Fish-installatie- en _config_-pad (standaard: `~/.config/omf`),
waardoor het [`init.fish`](/init.fish)-script naderhand wordt aangeroepen. Dit script bevat een lijst met geïnstalleerde pakketten, thema's en aangepaste init-bestanden.

Lees voor meer informatie de [veelgestelde vragen](./FAQ.md#wat-doet-oh-my-fish-precies).

### Puntbestanden

De `$OMF_CONFIG`-map duidt de gebruikersstatus van Oh My Fish aan. Dit is dé perfecte map om toe te voegen aan uw puntbestanden en/of versiebeheersysteem. De map bevat drie belangrijke bestanden:

- __`theme`__ - het huidige thema
- __`bundle`__ - de lijst met geïnstalleerde pakketten en thema's
- __`channel`__ - het OMF-updatekanaal (stable of dev)

Verder kunt u deze speciale bestanden aanmaken of aanpassen:

- __`init.fish`__ - aangepast script dat wordt uitgevoerd na het starten van de shell
- __`before.init.fish`__ - aangepast script dat wordt uitgevoerd vóór het starten van de shell
- __`key_bindings.fish`__ - aangepaste sneltoetsen die kunnen worden toegewezen met de opdracht `bind`

#### Variabelen instellen in `init.fish`

Eén van de meestgebruikte opstartopdrachten in `init.fish` is de variabelendefinitie. Zulke variabelen dienen beschikbaar te zijn in elke shellsessie. Dit kan bijvoorbeeld middels het volgende:

```fish
# Voor Golang-ontwikkelaars
set -xg GOPATH $HOME/gocode

# Voor Python-ontwikkelaars
set -xg PYTHONDONTWRITEBYTECODE 1
```

#### Over de bundel

Telkens als een pakket of thema geïnstalleerd of verwijderd wordt, wordt het `bundle`-bestand bijgewerkt. U kunt dit bestand tevens handmatig aanpassen en nadien `omf install` uitvoeren om de wijzigingen toe te passen. Let op: als pakketten of thema's automatisch geïnstalleerd zijn, leidt verwijderen uit de bundel niet tot deïnstallatie.

#### Oudere Fish-versies

Fish 2.2 bevat geen `conf.d`-map, dus dient de opstartcode toegevoegd te worden aan het Fish-configuratiebestand (`~/.config/fish/config.fish`).

Het is raadzaam om uw aangepaste opstartopdracht toe te voegen aan `init.fish` in plaats van `~/.config/fish/config.fish`, zodat de gehele `$OMF_CONFIG`-map beschikbaar blijft voor versiebeheer.

Als opstartopdrachten uitgevoerd dienen te worden *vóór* Oh My Fish start, voeg ze dan toe aan `before.init.fish`. Voeg bij twijfel alles toe aan `init.fish`.

## Pakketten maken

Oh My Fish gebruikt een geavanceerde, goedgedocumenteerde plug-inarchitectuur om het maken van plug-ins te vereenvoudigen, inclusief init- en uninstall-opties, functies en automatische aanvulling. Lees voor meer informatie [de pakketdocumentatie](Packages.md).


[fishshell]: http://fishshell.com
[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
[releases]: https://github.com/oh-my-fish/oh-my-fish/releases
