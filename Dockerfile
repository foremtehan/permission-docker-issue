FROM php:8.1.2-fpm-buster

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install git zip unzip -y

RUN groupadd -g 1001 app && useradd -m -u 1001 -g app app

RUN mkdir -p /app

RUN chown app /app

USER app

WORKDIR /app

COPY --chown=app:app . .