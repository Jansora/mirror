FROM ccr.ccs.tencentyun.com/jansora/base:v6
#FROM jansora/base:v6
ENV LANG C.UTF-8

ENV LC_CTYPE=C.UTF-8

RUN apt update

RUN apt install zip openjdk-17-jdk -y

COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas

RUN echo "alias as.sh='java -jar /opt/arthas/arthas-boot.jar'" >> ~/.bashrc


WORKDIR /root