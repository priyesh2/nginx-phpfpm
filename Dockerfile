# Use an official PHP FPM image as the base image
FROM php:fpm

# Install Nginx and other dependencies
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy PHP-FPM configuration file to the container
COPY php-fpm.conf /usr/local/etc/php-fpm.conf

# Copy index.php file to /var/www/html
COPY index.php /var/www/html/index.php

# Start Nginx and PHP-FPM services
CMD service nginx start && php-fpm

# Expose 80
EXPOSE 80 443

