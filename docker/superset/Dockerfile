FROM ccr.ccs.tencentyun.com/jansora/superset:4.1.1

USER root

RUN apt update && apt install unzip zip && rm -rf /var/lib/apt/lists/*
# 1. 复制并解压 InstantClient（ADD 会自动解压）
ADD instantclient-basic-linux.x64-19.3.0.0.0dbru.zip /opt/
RUN unzip -q /opt/instantclient-basic-linux.x64-19.3.0.0.0dbru.zip -d /opt/ && \
    mv /opt/instantclient_19_3 /opt/instantclient && \
    ln -sf /opt/instantclient/libclntsh.so.19.1 /opt/instantclient/libclntsh.so && \
    echo /opt/instantclient > /etc/ld.so.conf.d/oracle.conf && \
    ldconfig
# 2. 装 Python 驱动
RUN pip install --no-cache-dir \
    PyMySQL psycopg2-binary pymssql \
    snowflake-sqlalchemy sqlalchemy-redshift \
    sqlalchemy-bigquery clickhouse-sqlalchemy oracledb
USER superset