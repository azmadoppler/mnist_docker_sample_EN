# DockerとPoetry, Pytorchを用いてMNISTを実行する方法

## はじめに

- 2024年4月時点のDockerとPoetryを用いたPyTorch環境でMNISTを実行するサンプルです。

- PyTorch以外に深層学習でよく使うライブラリのインストールとLinter, Formatterの設定をします。

- Docker, SSH, Dev Containerについて勉強しておくと個別で環境構築する際に役立ちます。

## 参考資料について

初めて深層学習を実行する方は以下の資料が参考になると思いますので、ぜひ活用してください。

- [20220621_勉強会_深層学習入門.ipynb](/20220621_勉強会_深層学習入門.ipynb)（この資料はTensorFlowを用いたコードとなっているため、Google Colaboratoryで実行してください。）

- [研究で参考になるかもしれないリポジトリ](https://github.com/orgs/bisbislab/repositories)（先人達が作成したリポジトリです。参考になるコードがあるかも？）

- [Poetryの使い方](/markdown/Poetry.md)

## 動作環境

以下の環境で動作済み

- Ubuntu 22.04
- Git 2.34.1
- Docker 26.0.1
- CUDA Drive (nvidia driver) 537.42

## セットアップ手順

0. サーバーにGit, Docker, CUDA, nvidia-container-toolkitをインストール
    - Dockerとnvidia-container-toolkitのインストール方法については[Dockerのセットアップ方法](/markdown/Docker_Setup.md)を確認してください。

1. ローカル上のPCにVSCodeの拡張機能Remote Developmentをインストール

    - Remote DevelopmentはRemote-SSH, WSL, Dev Containersの拡張機能をまとめてインストールしてくれます。
    
    - 拡張機能ビュー (`Ctrl+Shift+X`) で「Remote Development」と検索し、インストールします。

2. Remote-SSHを使ってサーバー上のアカウントにログインする

    - Remote-SSHの使い方については、[Remote-SSHの使い方](/markdown/Remote_SSH.md)を確認してください。

3. `Ctrl+J`を押し、VSCode上でターミナルを開く

4. サーバー上の適当なフォルダにclone

    ```
    git clone https://github.com/w034ff/mnist_docker_sample.git
    ```

5. 4でcloneしたサーバー上のmnist_docker_sampleフォルダに移動

    ```
    cd mnist_docker_sample
    ```

6. Dockerコンテナ作成用の`.env`ファイル作成

    ```
    sh .devcontainer/generate_env.sh
    ```

6. Dev Containersを使用してコンテナ環境に入る（ビルドに20分くらいかかります。）

    - File -> Save Workspace As
    - `Ctrl+Shift+P`=>`Dev Containers: Rebuild Container`

9. Poetryでインストールしたライブラリが使えるか確認（PyTorchでCUDAが使えるか確認）

    - Jupyter Labを起動し、`MNIST_pytorch.ipynb`を開く

    ```
    jupyter lab --allow-root --no-browser
    ```

## Jupyter Labの実行について

- Jupyterは実行したカーネルをシャットダウンするまでGPUメモリを継続的に使用します。そのため、Jupyterはデータの整理や前処理、結果のまとめに利用し、GPUを使用する計算処理はPythonスクリプト（.pyファイル）で実行することをお勧めします。

- Jupyterを実行する際はポートを開放する必要があります。同一ポートへの複数人からのアクセスはできないため、各自の[docker-compose.yml](/docker-compose.yml)および[devcontainer.json](/.devcontainer/devcontainer.json)のポート番号が重複しないように修正してください。

## Linter, Formatterについて

- 以下のLinter, Formatterがインストールされます。
    
    - black
    - isort
    - mypy
    - flake8 (pyproject-flake8)

- Dev Containersで起動することで保存するたびに自動でフォーマットがかかります。
- 各種設定は [pyproject.toml](/pyproject.toml), [devcontainer.json](/.devcontainer/devcontainer.json) を確認してください。

## 参考文献

- [PoetryとDockerを用いたPyTorch環境構築サンプル](https://github.com/bisbislab/pytorch_poetry_docker_sample/)
