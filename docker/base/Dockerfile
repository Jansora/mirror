FROM ubuntu:20.04

ENV LANG C.UTF-8

ENV LC_CTYPE=C.UTF-8

RUN apt update

RUN apt install apt-transport-https ca-certificates -y

COPY ./dependencies/sources.list /etc/apt

RUN apt update

RUN apt install vim net-tools lrzsz curl wget -y




WORKDIR /root