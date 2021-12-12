FROM ubuntu:18.04

WORKDIR /root

RUN apt update

RUN apt install apt-transport-https ca-certificates -y

COPY ./dependencies/sources.list /etc/apt

RUN apt update