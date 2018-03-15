FROM debian:jessie

RUN apt-get update --fix-missing \
    && apt-get install -y \
    curl wget git

RUN apt-get install -y \
    php5 \
    php5-cli \
    php5-common \
    php5-gd \
    php5-mcrypt \
    php5-fpm \
    php5-curl \
    php5-memcached \
    php5-xdebug \
    php5-xhprof \
    php5-mysql \
    php-pear \
    php5-dev


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN echo "alias phpcs=vendor/bin/phpcs" >> ~/.bashrc

WORKDIR /var/www/html/phpcstest/
CMD ["/var/www/html/phpcstest/ss.sh"]