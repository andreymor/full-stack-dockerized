FROM php:7.1-fpm-alpine

# Maintainer
MAINTAINER Andrey Moretti <andreymor@gmail.com>

ENV DIR=/usr/src/api
# Change directory so that our commands run inside this new directory
WORKDIR $DIR

#Installing PHP extension needed
RUN set -ex \
      && apk --no-cache add \
        postgresql-dev \
        curl

RUN docker-php-ext-install pgsql pdo_pgsql zip

#Installing COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# before switching to user we need to set permission properly
COPY . $DIR

# Expose the port the app runs in
EXPOSE 3000

# Serve the app and building configuration
CMD ["/bin/sh", "-l"]