FROM php:7.4-apache
COPY ./src /var/www/html
RUN pecl install redis-4.0.1 && \
    docker-php-ext-enable redis && \
    docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli && \
    chown -R www-data:www-data /var/www
EXPOSE 80
VOLUME  ["/var/www/html"]
