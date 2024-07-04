# WHow to run MNIST with Docker, Poetry and Pytorch.

## Introduction.

- This is a sample of running MNIST in a PyTorch environment using Docker and Poetry as of April 2024.

- In addition to PyTorch, you will install libraries commonly used in deep learning such as Python Package and Formatter.

- Learning about Docker, SSH and Dev Container will be useful when building individual environments. (However, this tutorial won't go into in depth)

- If you are using TensorflowGPU instead of PyTorch, overwrite any files in the tensorflow folder and move them to the Root/Base folder.

rch, overwrite any files in the tensorflow folder and move them to the Root/Base folder.

## About the reference material (Japanese)

If you are running deep learning for the first time, please use the following documents as a reference. 

- [20220621_勉強会_深層学習入門.ipynb](/20220621_勉強会_深層学習入門.ipynb)（This document is code using TensorFlow, so please run it on Google Colaboratory.）

- [Repositories that may be helpful in your research(Japanese)](https://github.com/orgs/bisbislab/repositories) (These are repositories created by previously lab student. Might have code that could be helpful?)

- [How to use Poetry](/markdown/Poetry.md)


## Operating environment

The following environments have been tested

- Ubuntu 22.04
- Git 2.34.1
- Docker 26.0.1
- CUDA Drive (nvidia driver) >480

## Installation

0. install Git, Docker, CUDA and nvidia-container-toolkit on the server
    - For information on how to install Docker and nvidia-container-toolkit, check [How to set up Docker](/markdown/Docker_Setup.md).

1. install the VSCode extension Remote Development on a local PC

    - When you install Remote Development, all the package (Remote-SSH, WSL and Dev Containers) extensions is installed together.
    - Search for 'Remote Development' in the Extensions view (`Ctrl+Shift+X`) and install.

2. Log in to an account on the server using Remote-SSH

    - For information on how to use Remote-SSH, check [How to use Remote-SSH](/markdown/Remote_SSH.md).

3. Press `Ctrl+J` and open a terminal on the VSCode

4. Clone the Github page to a folder on the server/device

    ```
    git clone https://github.com/azmadoppler/mnist_docker_sample.git
    ```

5.  Go to the mnist_docker_sample folder on the server cloned in Step 4.

    ```
    cd mnist_docker_sample
    ```

6. Creating `.env` files for Docker container creation.

    ```
    sh .devcontainer/generate_env.sh
    ```

6. Use Dev Containers to enter the container environment (takes about 20 minutes to build).

    - File -> Save Workspace As
    - `Ctrl+Shift+P`=>`Dev Containers: Rebuild Container`

9. Check if libraries installed in Poetry are usable (check if CUDA is usable in PyTorch).

    - Start Jupyter Lab and open `MNIST_sample.ipynb.ipynb`.

    ```
    jupyter lab --allow-root --no-browser
    ```

## Running Jupyter Lab
- Jupyter continuously uses GPU memory until the kernel it runs is shut down. It is therefore recommended to use Jupyter for organising data, pre-processing and summarising results, and to run GPU-intensive computational processes in Python scripts (.py files).
- Ports must be open when running Jupyter. As the same port cannot be accessed by more than one person, it is recommended that the port numbers in your [docker-compose.yml](/docker-compose.yml) and [devcontainer.json](/.devcontainer/devcontainer.json) are Fix numbers so that they do not overlap.
- Ports must be open when running Jupyter. As the same port cannot be accessed by more than one person, it is recommended that the port numbers in your [docker-compose.yml](/docker-compose.yml) and [devcontainer.json](/.devcontainer/devcontainer.json) are Fix numbers so that they do not overlap.


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
