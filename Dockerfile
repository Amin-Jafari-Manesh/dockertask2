FROM hub.hamdocker.ir/php:7.4-fpm

WORKDIR /var/www

COPY composer.lock composer.json /var/www/

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=hub.hamdocker.ir/library/composer:2.7.2  /usr/bin/composer /usr/bin/composer

COPY . /var/www

USER www-data

EXPOSE 9000
CMD ["php-fpm"]
