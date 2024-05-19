# Poetryの使い方

## はじめに

2024年4月時点のPoetryの使い方について簡易的に説明します。

## 動作環境

以下の環境で動作済み

- Ubuntu 22.04
- Docker 26.0.1
- Poetry 1.8.2

## パッケージの追加

以下のコマンドでPythonパッケージを追加できます。

  ```
  poetry add <追加したいパッケージ名>
  ```

## パッケージの削除

以下のコマンドでPythonパッケージを削除できます。

  ```
  poetry add <削除したいパッケージ名>
  ```

## Dockerコンテナ内でのパッケージの追加・削除について

Dockerコンテナ内でパッケージを追加・削除しても、現在のコンテナに反映されないことがあります（例：ModuleNotFoundError: No module named `<追加したいパッケージ名>`）。そのため、パッケージを追加・削除した場合はコンテナのリビルドをお勧めします。

## パッケージのバージョンについて

深層学習のソースコードを実行する際は、必要なパッケージのバージョンが正しく合っていることが非常に重要です。バージョンが異なると、コードが正しく動作しないことがありますので、注意してください。

## 参考文献

- [Dockerコンテナにパッケージ管理ツールpoetryを使ってPythonの分析環境を構築する方法](https://qiita.com/yolo_kiyoshi/items/332ae902aeb730fbd068)

- [Poetryで追加したライブラリを削除する](https://qiita.com/ssf2xguile/items/4e5474deecd6d3195b9a)

- [PoetryでPytorchをインストールする方法](https://zenn.dev/yumizz/scraps/fa4c781cc72a37)
