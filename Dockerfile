FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/hoge/.local/bin:${PATH}"
# タイムゾーン設定
ENV SHELL=/bin/bash
ENV TZ=Asia/Tokyo
RUN apt-get update && apt-get install -y tzdata

ARG USER_NAME=${USER_NAME}
ARG USER_UID=${USER_UID}
ARG USER_GID=${USER_GID}

WORKDIR /workspace
COPY pyproject.toml poetry.lock /workspace/

RUN groupadd --gid $USER_GID $USER_NAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME && \
    apt-get update && \
    apt-get -y install --no-install-recommends locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
    apt-get -y install --no-install-recommends software-properties-common && \
    add-apt-repository "ppa:deadsnakes/ppa" -y && \
    apt-get -y install --no-install-recommends \
    curl \
    git \
    libgl1-mesa-dev \
    python3.11 \
    sudo && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.11 get-pip.py && \
    rm get-pip.py && \
    ln -s python3.11 python && \
    mv python /usr/bin/ && \
    pip install --no-cache-dir poetry && \
    poetry config virtualenvs.create false && \
    poetry install

USER $USER_NAME

CMD ["/bin/bash"]
