FROM kong:1.2.0

USER root

# 将插件源代码添加到镜像中
COPY url-rewrite/kong-plugin-url-rewrite/* /usr/local/share/lua/5.1/kong/plugins/url-rewrite

COPY url-rewrite/kong.conf /etc/kong/

USER kong
