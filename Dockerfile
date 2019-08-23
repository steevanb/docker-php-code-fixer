FROM php:7.3.8-fpm-alpine3.10

ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

ENV PATH "$PATH:/root/.composer/vendor/bin"
RUN composer global require wapmorgan/php-code-fixer 2.0.19

CMD phpcf /var/php-code-fixer
