FROM docker.1ms.run/library/ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV NPM_CONFIG_YES=true
#ENV PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple
#ENV PIP_TRUSTED_HOST=mirrors.aliyun.com

# ------------------------------------------------------------
# 1. 换 APT 源为阿里云
# ------------------------------------------------------------
RUN sed -i 's@http://.*archive.ubuntu.com/ubuntu/@http://mirrors.aliyun.com/ubuntu@g' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i 's@http://.*security.ubuntu.com/ubuntu/@http://mirrors.aliyun.com/ubuntu@g' /etc/apt/sources.list.d/ubuntu.sources

RUN cat /etc/apt/sources.list.d/ubuntu.sources
# ------------------------------------------------------------
# 2. 安装依赖（使用阿里云源）
# ------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget git ca-certificates build-essential \
    zlib1g-dev libffi-dev libssl-dev libbz2-dev liblzma-dev \
    libreadline-dev libsqlite3-dev libncursesw5-dev libgdbm-dev uuid-dev \
    && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------
# 3. 安装 Python 3.13.5（使用阿里云 pip）
# ------------------------------------------------------------
WORKDIR /tmp

RUN wget https://mirrors.aliyun.com/python-release/source/Python-3.13.5.tgz || \
    wget https://www.python.org/ftp/python/3.13.5/Python-3.13.5.tgz && \
    tar -xf Python-3.13.5.tgz && \
    cd Python-3.13.5 && \
    ./configure --prefix=/usr/local \
                --enable-optimizations \
                --with-lto \
                --enable-shared \
                LDFLAGS="-Wl,-rpath /usr/local/lib" && \
    make -j"$(nproc)" && \
    make install && \
    ldconfig && \
    cd /tmp && rm -rf Python-3.13.5 Python-3.13.5.tgz


# ------------------------------------------------------------
# 4. 安装 Node.js 22（NodeSource 官方源）
# ------------------------------------------------------------
RUN cd /tmp && curl -fsSL https://mirrors.aliyun.com/nodejs-release/v24.1.0/node-v24.1.0-linux-x64.tar.gz -o node-v24.1.0-linux-x64.tar.gz && \
   tar zxvf node-v24.1.0-linux-x64.tar.gz && \
    mv node-v24.1.0-linux-x64/bin/node /usr/local/bin && \
    mv node-v24.1.0-linux-x64/bin/npm /usr/local/bin && \
    mv node-v24.1.0-linux-x64/bin/npx /usr/local/bin && \
    rm -rf /tmp/node-v*

ENV NPX_NODE_OPTIONS="--no-warnings"


# ------------------------------------------------------------
# 5. 设置 pip 全局使用阿里云镜像
# ------------------------------------------------------------
#RUN mkdir -p /root/.pip && \
#    printf "[global]\nindex-url = https://mirrors.aliyun.com/pypi/simple\ntrusted-host = mirrors.aliyun.com\n" > /root/.pip/pip.conf

# ------------------------------------------------------------
# 6. 安装 Node.js 22（NodeSource 官方源）
# ------------------------------------------------------------
RUN apt-get update && apt-get install -y npm && \
    rm -rf /var/lib/apt/lists/*

ENV NPX_NODE_OPTIONS="--no-warnings"

# ------------------------------------------------------------
# 7. 校验环境
# ------------------------------------------------------------
RUN python3.13 --version && \
    pip3.13 --version && \
    node --version && \
    npm --version && \
    npx --version


# ------------------------------------------------------------
# 8. 设置快捷方式
# ------------------------------------------------------------
RUN ln -sv /usr/local/bin/python3 /usr/local/bin/python
RUN ln -sv /usr/local/bin/pip3 /usr/local/bin/pip

# ------------------------------------------------------------
# 9. 默认工作目录
# ------------------------------------------------------------
WORKDIR /app

CMD ["bash"]
