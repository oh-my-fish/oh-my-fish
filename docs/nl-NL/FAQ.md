<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Veelgestelde vragen

> Oh My Fish-documentatie&nbsp;&bull;&nbsp;Ook beschikbaar in het
> <a href="../en-US/FAQ.md">🇺🇸</a>
> <a href="../es-ES/FAQ.md">🇪🇸</a>
> <a href="../pt-BR/FAQ.md">🇧🇷</a>
> <a href="../ru-RU/FAQ.md">🇷🇺</a>
> <a href="../uk-UA/FAQ.md">🇺🇦</a>
> <a href="../zh-CN/FAQ.md">🇨🇳</a>

<br>

Fijn dat u even de tijd neemt om de veelgestelde vragen door te nemen. Als uw vraag hierna nog niet beantwoord is, open dan een 'issue'.


## Wat is Oh My Fish en waarom zou ik het willen gebruiken?

Oh My Fish (OMF) is een _framework_ voor de [Fish-shell](http://fishshell.com/). OMF helpt u de configuratie te beheren en thema's en pakketten te installeren.


## Wat moet ik kennen om Oh My Fish te kunnen gebruiken?

_Niks_. Installeer Oh My Fish en gebruik Fish zoals gebruikelijk. Typ `omf help` als u iets nieuws wilt leren.


## Wat zijn Oh My Fish-pakketten?

Oh My Fish-pakketten zijn thema's of plug-ins, geschreven in fish, die de kernfunctionaliteit uitbreiden, code uitvoeren tijdens het opstarten, automatische aanvullingen van veelgebruikte programma's toevoegen, etc.


## Wat voor Oh My Fish-pakketten zijn er zoal beschikbaar?

Er zijn 3 soorten pakketgroepen:

1. Configuratiehulpmiddelen. Een voorbeeld hiervan is [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv), dat controleert of `pyenv` aanwezig is op uw systeem en `(pyenv init - | psub)` uitvoert tijdens het opstarten.

2. Thema's. Bekijk de [themagalerij](https://github.com/oh-my-fish).

3. Traditionele shell-hulpmiddelen. Een voorbeeld hiervan is [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy), een klembordbeheerder die op zowel Linux als macOS werkt.


## Wat doet Oh My Fish precies?

+ Voert `$OMF_CONFIG/before.init.fish` uit (indien beschikbaar).

+ Laadt automatisch pakketten en thema's uit `$OMF_PATH/`.

+ Laadt automatisch uw configuratiepad. Standaard is dit `~/.config/omf`, maar dit is instelbaar middels `$OMF_CONFIG`.

+ Laadt automatisch de `functions`-map uit `$OMF_PATH` en `$OMF_CONFIG`

+ Voert `$OMF_CONFIG/init.fish` uit (indien beschikbaar).


## Hoe kan ik een reeds aanwezige Oh My Fish-installatie bijwerken?

> :warning: Maak een back-up van uw verborgen bestanden en andere belangrijke gegevens.

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

U kunt `$fish_path` nu veilig verwijderen.

```fish
rm -rf "$fish_path"
```


## Hoe stel ik Fish in als mijn standaardshell?

Voeg Fish toe aan `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

en schakel over:

```sh
chsh -s /usr/local/bin/fish
```

Indien gewenst kunt u altijd terug naar de vorige standaardshell:
> Vervang, indien nodig, `/bin/bash` door `/bin/tcsh` of `/bin/zsh`.

```sh
chsh -s /bin/bash
```
