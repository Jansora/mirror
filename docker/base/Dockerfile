FROM ubuntu:20.04

ENV LANG C.UTF-8

ENV LC_CTYPE=C.UTF-8

RUN apt update

RUN apt install apt-transport-https ca-certificates -y

COPY ./dependencies/sources.list /etc/apt

RUN apt update

RUN apt install vim net-tools lrzsz curl wget tzdata -y

# 添加时区环境变量，亚洲，上海
ENV TimeZone=Asia/Shanghai
# 使用软连接，并且将时区配置覆盖/etc/timezone
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime  \
    echo $TimeZone > /etc/timezone


WORKDIR /root