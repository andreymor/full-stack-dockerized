FROM node:6.11.3-alpine as frontbuilder

# Maintainer
MAINTAINER Andrey Moretti <andreymor@gmail.com>

ENV DIR=/usr/src/frontend
ENV PHANTOMJS_ARCHIVE="phantomjs.tar.gz"

RUN npm i -g @angular/cli@latest && npm cache clean

COPY package.json ./

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main'>> /etc/apk/repositories \
	&& apk --update add curl \
	&& curl -Ls https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz \
       | tar xz -C /

RUN npm i && \
    npm cache clean && \
    mkdir -p $DIR && \
    cp -R ./node_modules .$DIR

WORKDIR $DIR

COPY . $DIR

CMD ["/bin/sh", "-l"]