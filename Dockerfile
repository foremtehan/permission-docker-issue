FROM php:8.1.2-fpm-buster

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install git zip unzip -y

RUN groupadd -g 1001 app && useradd -m -u 1001 -g app app

USER app

WORKDIR /var/www/html

COPY --chown=app:app . .