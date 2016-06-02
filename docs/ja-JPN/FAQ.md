<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <a href="../en-US/FAQ.md">English</a> &bull;
  <a href="../zh-CN/FAQ.md">简体中文</a> &bull;
  <a href="../ru-RU/FAQ.md">Русский</a> &bull;
  <b>日本語</b>
</p>


# FAQ

このFAQを読んでくださりありがとうございます。もしあなたが求めている回答がここで得られなかった場合、気軽に新しいissueを立ててみてください。


## Oh My Fishとはどんなもので、なぜそれが必要なのか

Oh My Fishは[Fishshell](http://fishshell.com/)のための _フレームワーク_ の１つです。
あなたが設定やテーマ、パッケージを管理することを簡単にしてくれます。


## Oh My Fishを使うために何を知る必要があるのか

_何もありません_。 Oh My Fishをインストールしても、これまでと同様にFishを使い続けることができます。あなたがOh My Fishについてより詳しく知りたい場合は、`omf help`と打ってみてください。


## Oh My Fishのパッケージにはどんなものがあるのか

Oh My Fishのパッケージにはshellのコアの機能面を拡張したり、初期化の間にコードを走らせたり、ノウンユーティリティ（既知のコマンドなど）のオートコンプリーションといったfishで書かれたテーマやプラグインがあります。


## Oh My Fishにはどのような種類のパッケージがあるのか

Oh My Fishには、主に3種類のパッケージがあります:

1. 設定ユーティリティ。例えば、[`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv)はあなたのシステム内に`pyenv`が存在するかどうかを確認し、スタートアップの間に`(pyenv init - | psub)`を走らせます。　

2. テーマ。ぜひとも[theme gallery](https://github.com/oh-my-fish)を覗いてみてください。

3. お馴染みのシェルユーティリティ。例えば、[`pkg-copy`](https://github.com/oh-my-fish/pkg-copy)はLinuxとOSX間を互換するクリップボードユーティリティです。


## 結局のところ、Oh My Fishは何をするのか

+ 可能であれば、`$OMF_CONFIG/before.init.fish`を走らせてください。

+ `$OMF_PATH/`以下にあるインストール済みのパッケージやテーマをオートロードします。

+ 設定パスをアートロードします。デフォルト設定では`~/.config/omf`を読みますが、`$OMF_CONFIG`から設定可能です。

+ `$OMF_PATH`や`$OMF_CONFIG`以下にあるいかなる`functions`ディレクトリは直接オートロードされます。

+ 可能であれば、`$OMF_CONFIG/init.fish`を実行してください。


## どのようにして既存のOh My Fishインストレーションをアップグレードするか

> :注意: まずはじめに、dotfilesや他の重要なデータをバックアップすることを忘れないでください。

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

これでやっと `$fish_path`を取り除くことができます.

```fish
rm -rf "$fish_path"
```


## どうすればfishをデフォルトのシェルとして使えるのか

Fishに`/etc/shells`を加えてください:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

fishをあなたのデフォルトのシェルに変えます:

```sh
chsh -s /usr/local/bin/fish
```

デフォルトのシェルを元に戻すには:
> Substitute `/bin/bash` with `/bin/tcsh` or `/bin/zsh` as appropriate.

```sh
chsh -s /bin/bash
```
