# Start from apache base image
FROM php:5.6-apache

RUN docker-php-ext-install mysqli

# Copy contents of the public_html and utils
COPY ./public_html /var/www/html/
COPY ./utils /var/www/utils/
