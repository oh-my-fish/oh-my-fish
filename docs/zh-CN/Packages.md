<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <a href="../en-US/Packages.md">English</a> &bull;
  <a href="../zn-CN/Packages.md">简体中文</a> &bull;
  <a href="../ru-RU/Packages.md">Русский</a> &bull;
  <b>日本語</b>
</p>

# Creating

パッケージを作ることについて学びたいのなら、あなたのシェルに`hello_world`コマンドを与える新しいパッケージを作ってみましょう。パッケージの名前は小文字や単語同士をつなぐハイフンしか使えません。

Oh My Fishはあなたのためのパッケージ構成をスキャフォールド生成します。`omf new`コマンドを使ってください:

```fish
$ omf new pkg hello_world
```

> テーマには `omf new theme my_theme_name` を使ってください。

ユーティリティは現在いるディレクトリから新しく生成されたパッケージに変わります:

```
$ ls -l
  README.md
  hello_world.fish
  completions/hello_world.fish
```

いつでも`README.md`にあなたのパッケージがどんな働きをするのかを加えることができます。 また[auto completion](http://fishshell.com/docs/current/commands.html#complete) をよく読んだ上で、適切なタイミングかつ注意した上であなたのユーティリティにそれを加えてください。

`hello_world.fish`は１つの機能を定義します:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

あなたのパッケージの中のどの機能もそれらが記述されたファイル内で宣言されていないといけません。
オンデマンドで機能をロードしたり、使われない機能がローディングされるのを避けたりするオートローディングのメカニスムによって必須となります。

fishはプライベートスコープを持たないということを覚えておいてください。なので、もしあなたのパッケージを機能毎に分割する必要がある場合は次のようにプライベートスコープをプレフィックシングすることを考えてみてください: `__hello_world.my_extra_function`, to avoid both name clashes and すでに存在する値への再定義(global namespace pollution).

# イベント

パッケージはfishイベントを活用するよう設計されました。Oh My Fishがあなたのパッケージに提供する2つのイベントがあります:

## 初期化

もしもあなたのパッケージのロード中にIf you want to be [notified](http://fishshell.com/docs/current/commands.html#emit), あなたの`hello_world.fish`の中に以下のファンクションを宣言してください:

```fish
function init -a path --on-event init_hello_world
  echo "hello_world initialized"
end
```

環境やロードリソース、オートロード機能などを修正するにはこのイベントを使ってください。もしあなたのパッケージがいかなる機能も出力しなかった場合は, まだパッケージに機能性を加えるためのこのイベントを使うことができます。

## アンインストール

Oh My Fish`omf remove <pkg>`を介してパッケージが取り除かれる前に、`uninstall_<pkg>`イベントを行います。任意でカスタムリソースを整理するためのイベントとして用いることができます。

```fish
function uninstall --on-event uninstall_hello_world
end
```


# 公開

Oh My Fishでは`$OMF_PATH/db/`以下に公開パッケージのレジストリがあります。

加える必要があるレジストリにあなたのパッケージを加えるには:

```fish
# For packages:
omf submit pkg/hello_world .../hello_world.git

# For themes
omf submit theme/my_theme .../my_theme_name.git
```

これはローカルにコピーしたレジストリに対して新しいエントリを加えます。グローバルレジストリにアップデートしたい場合は、[私たちへPRを送る][omf-pulls-link] 必要があります。


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
