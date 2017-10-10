FROM node:6-alpine

# Maintainer
MAINTAINER Andrey Moretti <andreymor@gmail.com>

ENV DIR=/usr/src/frontend

RUN npm i -g @angular/cli@1.4.3 && npm cache clean

COPY package.json ./

RUN npm i && \
    npm cache clean && \
    mkdir -p $DIR && \
    cp -R ./node_modules .$DIR

WORKDIR $DIR

COPY . $DIR

CMD ["/bin/sh"]