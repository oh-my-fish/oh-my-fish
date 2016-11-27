<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> The <a href="http://fishshell.com">Fishshell</a> Framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE.md) [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)


Oh My FishはあなたのシェルのUIを変更・拡張するパッケージをインストール可能にするコアインフラストラクチャを提供しています。速く、広くかつ簡単に使うことができます。

<br><br>

<p align="center">
  <a href="../../README.md">English</a> &bull;
  <a href="../zh-CN">简体中文</a> &bull;
  <a href="../ru-RU/README.md">Русский</a> &bull;
  <b>日本語</b>
</p>

## Installation

```fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf help
```

ダウンロードをしてからインストールする場合:

```fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
fish install
```

# Getting Started

Oh My Fishには新しいテーマやパッケージをフェッチやインストールをする時に使うちょっと便利な`omf`コマンドがあります。

#### `omf update` _`[omf]`_ _`[<package>...]`_

フレームワークとインストール済みのパッケージをアップデートします。

- 引数なしで実行した場合、コア(oh-my-fish)と全てのインストール済みのパッケージがアップデートされます。
- コアのみをアップデートしたい場合、`%omf update omf`を実行してください。
- 特定のパッケージを選んでアップデートする場合、アップデートしたいパッケージの名前を列挙してください。
 コアもアップデートしたい場合は、リストの中に”omf”を加えてください。

#### `omf install` _`[<name>|<url>]`_

1つ _もしくは複数_ のパッケージをインストールします。.

- URLからパッケージを直接インストールする場合は、 `omf install URL`を実行してください。
- 引数なしで実行した場合、[bundle](#dotfiles)内で管理されているパッケージをインストールします。

#### `omf list`

インストールしたパッケージを一覧表示します。

#### `omf theme` _`<theme>`_

テーマを設定できます。利用可能なテーマ一覧で表示させたい場合は、`omf theme`をタイプしてください。
また、インストール前に[preview available themes](../Themes.md) から現在利用可能な各テーマを確認することができます。

#### `omf remove` _`<name>`_

インストールしたテーマやパッケージを取り除くことができます。

> パッケージが取り除かれる前に、`uninstall_<pkg>` するパッケージのイベントは確認メッセージが出力されます。
そしてリソースのカスタムクリーンナップが完了します。より詳細な情報は[アンインストール](/Packages.md#uninstall) をご覧下さい。

#### `omf reload`

現在のシェルプロセスと新しいシェルプロセスに置き換える`exec`コマンドでoh-my-fishを始めとするすべてのプラグインをリロードします。

> このコマンドは`exec` により生じる副作用を軽減し、バックグラウンドプロセスの場合リロードを止め、可能な限り安全に行われます。

#### `omf new pkg | theme` _`<name>`_

新しいパッケージやテーマをscaffold生成します。

> これはテンプレートの`$OMF_CONFIG/{pkg | themes}/` 以下の新しいディレクトリを作ります。

#### `omf search` _`-t|--theme / -pkg|--package`_ _`<name>`_

提供されているパッケージやテーマ、またその両方用のoh my fishデータベースを検索します。
曖昧なワードでの検索もサポートしており、検索対象の名前が不確かな場合は`omf search simple`を実行してみてください。

#### `omf submit` _`pkg/<name>`_ _`[<url>]`_

新しいパッケージを追加します。テーマを追加する場合は、 `omf submit` _`themes/<name>`_ _`<url>`_ を使ってください。
コマンドの<url>部分はあなたのgithub上のレポジトリの _`[<url>]`_ にすべきです。
例えば、`example`プラグインを使う場合は,`omf submit pkg/example https://github.com/oh-my-fish/example`というコマンドになります。

記載のアップグレードをするには、[私たちにプルリクを投げる][omf-pulls-link]を参考にしてください。

#### `omf doctor`

[Issue報告][omf-issues-new].する前にトラブルシューティングをします。

#### `omf destroy`

Oh My Fishをアンインストールします。

## Advanced

Oh My Fishインストーラはスタートアップコードをあなたのfish config file(`~/.config/fish/config.fish`)に置きます。

### Startup

あなたが新しいシェルを開く度に、スタートアップコードがインストレーションパスとあなたのパッケージやテーマ、cutom init filesを自動でローディングしたあと[`init.fish`](init.fish) スクリプトを読みだした _config_ パス (`~/.config/omf` by default)を初期化します。

より詳しい情報はFAQを確認してください。


### Dotfiles

`$OMF_CONFIG` ディレクトリはOh My Fishのユーザ状態を表します。あなたのdotfilesに加えたり、バージョン管理にチェックアウトしたりするのに最適です。以下、特に重要な4つのファイルがあります。:

- __`theme`__ - 現在のテーマ
- __`bundle`__ - 現在インストールしたパッケージやテーマの一覧
- __`init.fish`__ - シェルを始めたあと読み込んだカスタムスクリプト
- __`before.init.fish`__ - シェルを始める前に読み込んだカスタムスクリプト

あなたのカスタムスタートアップコマンドが`~/.config/fish/config.fish`ではなく、`init.fish`ファイルを読むことを強くお勧めしています。
これはバージョンコントロール下のすべての`$OMF_CONFIG`ディレクトリを保持することを可能にします。

Oh My Fishがプラグインをローディングする *前* にスタートアップコマンドを走らせる必要がある場合、代わりにそれらのスタートアップコマンドを`%before.init.fish`に置いてください。

もしあなたがよく分からない状態の場合、スタートアップコマンドを`init.fish`内に置くのが通常ベストです。



#### About the bundle

パッケージやテーマをインストールしたり、取り除いたりする度に、`bundle`ファイルはアップデートされます。
変更を満足にするために、手動で編集したり`omf install`を行ったりできます。
パッケージやテーマがbundleに自動的にインストールされた場合、bundleから取り除かれたパッケージやテーマはユーザインストレーションからは取り除かれません。

## Creating Packages

Oh My Fishは機能のオートローディングやイベントの初期化やアンインストールを含んだプラグインの開発を簡単に行える発展し、正しく定義されたプラグイン構造を採用しています。
より詳しい情報を知りたい方は[ドキュメント](docs/en-US/Packages.md) をご覧ください。

[fishshell]: http://fishshell.com

[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors

[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls

[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
