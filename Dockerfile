FROM php:8.3-apache

# Installiere notwendige PHP-Erweiterungen und Apache-Module
RUN apt-get -y update \
    && apt-get install -y zlib1g-dev libicu-dev g++ apache2-utils \
    && docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && docker-php-ext-install intl && docker-php-ext-enable intl \
    && docker-php-ext-install pdo_mysql \
    && a2enmod rewrite # Aktiviert das Apache-Modul mod_rewrite

# Optional: Neustart des Apache-Servers kann erforderlich sein
