# Remote-SSHとDev Containersの使い方

## はじめに

- 2024年4月時点のRemote-SSHとDev Containersの使い方について説明します。


## 参考資料について

初めて深層学習を実行する方は以下の資料が参考になると思いますので、ぜひ活用してください。

- [20220621_勉強会_深層学習入門.ipynb](/20220621_勉強会_深層学習入門.ipynb)（この資料はTensorFlowを用いたコードとなっているため、Google Colaboratoryで実行してください。）

- [研究で参考になるかもしれないリポジトリ](https://github.com/orgs/bisbislab/repositories)（先人達が作成したリポジトリです。参考になるコードがあるかも？）

- [Poetryの使い方について](/Poetry.md)

## インストール方法

1. ローカル上のPCにVSCodeの拡張機能Remote Developmentをインストール
    
    - 拡張機能ビュー（`Ctrl+Shift+X`）で「Remote Development」と検索し、インストールします。



1. ローカル上のPCにVSCodeの拡張機能Remote Developmentをインストール

    - Remote DevelopmentはRemote-SSH, WSL, Dev Containersの拡張機能をまとめてインストールしてくれます。Dev ContainersとRemote-SSHの使い方については[Dev Containersの導入](DevContainers.md)を確認してください。

2. Remote-SSHを使ってサーバー上のアカウントにログインする

3. サーバー上の適当なフォルダにclone

    ```
    git clone https://github.com/w034ff/mnist_docker_sample.git
    ```

4. 3でcloneしたサーバー上のmnist_docker_sampleフォルダを開く

    ```
    cd mnist_docker_sample
    ```

5. Dockerコンテナ作成用の`.env`ファイル作成

    ```
    sh .devcontainer/generate_env.sh
    ```

6. Dev Containersを使用してコンテナ環境に入る（ビルドに20分くらいかかります。）
    
    - `Ctrl+Shift+P`=>`Dev Containers: Rebuild Container`

7. Poetryでインストールしたライブラリが使えるか確認（PyTorchでCUDAが使えるか確認）

    - Jupyter Labを起動し、`MNIST_pytorch.ipynb`を開く

    ```
    jupyter lab --allow-root --no-browser
    ```

## Jupyter Labの実行について

- Jupyterは実行したカーネルをシャットダウンするまでGPUメモリを継続的に使用します。そのため、Jupyterはデータの整理や前処理、結果のまとめに利用し、GPUを使用する計算処理はPythonスクリプト（.pyファイル）で実行することをお勧めします。

- Jupyterを実行する際はポートを開放する必要があります。同一ポートへの複数人からのアクセスはできないため、各自の[docker-compose.yml](/docker-compose.yml)および[devcontainer.json](/.devcontainer/devcontainer.json)のポート番号が重複しないように修正してください。


## 参考文献

- [Visual Studio Code で Remote SSH する。](https://qiita.com/nlog2n2/items/1d1358f6913249f3e186)
