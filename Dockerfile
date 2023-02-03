FROM php:8-apache
RUN apt-get -y update \
&& apt-get install -y zlib1g-dev libicu-dev g++ \ 
&& docker-php-ext-install mysqli && docker-php-ext-enable mysqli \ 
&& docker-php-ext-install intl && docker-php-ext-enable intl

