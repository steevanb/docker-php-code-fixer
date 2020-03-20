FROM php:7.4.3-cli-alpine3.11

ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

ENV PATH "$PATH:/root/.composer/vendor/bin"
RUN \
    # zip is for Composer, git and openssh for CircleCI
    apk add --no-cache zip git openssh \
    && composer global require wapmorgan/php-code-fixer 2.0.23

WORKDIR /app
CMD phpcf /app
