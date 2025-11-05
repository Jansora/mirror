FROM docker.1ms.run/library/openresty/openresty:alpine

# 创建 auth 文件夹
RUN mkdir -p /etc/nginx/conf.d /usr/local/openresty/nginx/html/scripts


# 拷贝 nginx 配置
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf


# 创建静态文件目录（不经常改动，放在前面）
RUN mkdir -p /static

EXPOSE 80

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
