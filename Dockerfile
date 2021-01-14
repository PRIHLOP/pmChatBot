FROM php:7-alpine
RUN apk --update add postgresql-dev git && rm /var/cache/apk/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
#RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql pgsql
WORKDIR /app
COPY . /app
RUN composer install
CMD ["php", "bot.php"]
