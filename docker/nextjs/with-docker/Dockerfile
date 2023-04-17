FROM ccr.ccs.tencentyun.com/jansora/base:v6

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN sudo apt-get install nodejs -y

WORKDIR /app

COPY  ./node_modules/next/dist/bin/next /usr/bin


ENV PORT 3000

CMD ["next", "start"]
