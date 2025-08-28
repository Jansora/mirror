FROM ubuntu:24.04

ENV LANG C.UTF-8
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN #sed -i.bak "s|http://.*.ubuntu.com|https://mirrors.tuna.tsinghua.edu.cn|g" /etc/apt/sources.list.d/ubuntu.sources

RUN apt update && apt install sshpass curl rsync wget net-tools gnupg -y

# 安装系统依赖、pip、PostgreSQL key、MySQL 源
RUN apt install -y \
    curl wget gnupg lsb-release ca-certificates \
    python3 python3-pip \
    build-essential libpq-dev \
    default-mysql-client

# 添加 PostgreSQL APT 源（含认证）
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    gpg --dearmor -o /etc/apt/keyrings/postgresql.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" \
    > /etc/apt/sources.list.d/pgdg.list

# 安装 psql 17
RUN apt update && apt install -y postgresql-client-17

# 安装 Python 库（使用清华源）
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --break-system-packages \
    psycopg2-binary pymysql oss2 requests beautifulsoup4 lxml bs4

# 验证安装
RUN psql --version && mysqldump --version && pip3 list
