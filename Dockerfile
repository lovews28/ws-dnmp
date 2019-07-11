FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-install -j$(nproc) iconv \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install redis

COPY ./extensions /tmp/extensions
WORKDIR /tmp/extensions

RUN tar xzf redis-5.0.5.tar.gz \
    && ( cd redis-5.0.5 && phpize && ./configure && make -j$(nproc) && make install ) \
    && docker-php-ext-enable redis \
    && rm -rf /tmp/extensions

WORKDIR /var/www/html