# Azurewind's PostgreSQL image with Chinese full text search
# build: docker build --force-rm -t chenxinaz/zhparser .
# run: docker run --name PostgreSQLcnFt -p 5432:5432 chenxinaz/zhparser
# run interactive: winpty docker run -it --name PostgreSQLcnFt -p 5432:5432 chenxinaz/zhparser --entrypoint bash chenxinaz/zhparser
ARG PG_MAJOR=18
ARG PG_TAG=18.0
FROM postgres:18.0
LABEL org.opencontainers.image.authors="Feng Yu<abcfy2@163.com>"

# COPY scws-1.2.3.tar.bz2 /scws-1.2.3.tar.bz2

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-transport-https bzip2 ca-certificates curl gcc libc6-dev make \
    
# 1. 添加 Pigsty 仓库（仅首次需执行）
RUN curl -fsSL https://repo.pigsty.io/pigsty.gpg | tee /usr/share/keyrings/pigsty.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/pigsty.gpg] https://repo.pigsty.io/apt $(cat /etc/lsb-release | grep DISTRIB_CODENAME |  cut -d'=' -f2) main" \
 | tee /etc/apt/sources.list.d/pigsty.list

RUN LIBPQ5_VER="$(dpkg-query --showformat='${Version}' --show libpq5)"    && \
    apt-get install -y libpq-dev="${LIBPQ5_VER}" "postgresql-server-dev-${PG_MAJOR}=${PG_VERSION}"

# 安装 PostGIS、pgVector、pgrouting、postgis-3-scripts
RUN apt-get install -y --no-install-recommends \
    postgresql-18-postgis-3 \
    postgresql-18-pgvector \
    postgresql-18-postgis-3-scripts \
    postgresql-18-pgrouting \
    postgresql-18-pg-graphql


RUN curl -fsSL -o /tmp/scws-1.2.3.tar.bz2 https://cdn.jansora.com/files/uPic/2025/11/06/scws-1.2.3.tar.bz2
RUN tar xjf /tmp/scws-1.2.3.tar.bz2 -C /tmp


RUN curl -fsSL -o /tmp/zhparser-master.tar.gz https://github.com/amutu/zhparser/archive/master.tar.gz
RUN tar xzf /tmp/zhparser-master.tar.gz -C /tmp
    

RUN cd /tmp/scws-1.2.3 && ./configure && make -j$(nproc) install V=0
RUN cd /tmp/zhparser-master  && make -j$(nproc) install
#RUN cd /tmp/pgvector-master && make -j$(nproc) install

RUN LIBPQ5_VER="$(dpkg-query --showformat='${Version}' --show libpq5)" \ 
&& apt-get purge -y gcc make libc6-dev curl bzip2 apt-transport-https ca-certificates \
&& apt-get purge -y libpq-dev="${LIBPQ5_VER}" "postgresql-server-dev-${PG_MAJOR}=${PG_VERSION}" \
&& apt-get autoremove --purge -y && apt-get clean 



RUN rm -rf /tmp/zhparser-master \
        /tmp/scws-1.2.3 \
        /var/lib/apt/lists/*


# pg_trgm is recommend but not required.
RUN echo "CREATE EXTENSION IF NOT EXISTS postgis;\n\
CREATE EXTENSION IF NOT EXISTS vector;\n\
CREATE EXTENSION IF NOT EXISTS pg_trgm;\n\
CREATE EXTENSION IF NOT EXISTS zhparser;\n\
DO\n\
\$\$BEGIN\n\
    CREATE TEXT SEARCH CONFIGURATION chinese_zh (PARSER = zhparser);\n\
    ALTER TEXT SEARCH CONFIGURATION chinese_zh ADD MAPPING FOR n,v,a,i,e,l,t WITH simple;\n\
EXCEPTION\n\
   WHEN unique_violation THEN\n\
      NULL;  -- ignore error\n\
END;\$\$;\n\
" > /docker-entrypoint-initdb.d/init-extensions.sql

