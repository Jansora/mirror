FROM harbor.fabric.jansora.app/jansora/ubuntu:20.04

ENV LANG C.UTF-8

ENV LC_CTYPE=C.UTF-8

USER root

WORKDIR /root

# 将插件源代码添加到镜像中
COPY dmanywhere.team.linux.0.8.4 /root/dmanywhere

RUN chmod 755 /root/dmanywhere

CMD ["/root/dmanywhere", "-p", "8080"]
