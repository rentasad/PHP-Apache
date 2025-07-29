FROM php:8.3-apache

# Installiere notwendige PHP-Erweiterungen und Apache-Module
RUN apt-get -y update \
    && apt-get install -y \
	libldap-dev \
	zip \
        git \
        zlib1g-dev \
        libicu-dev \
        g++ \
        apache2-utils \
        libldap2-dev \
    && docker-php-ext-configure ldap \
    && docker-php-ext-install \
        mysqli \
        intl \
        pdo_mysql \
        ldap \
    && docker-php-ext-enable \
        mysqli \
        intl \
        ldap \
    && a2enmod rewrite
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Optional: Neustart des Apache-Servers kann erforderlich sein
