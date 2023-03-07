# Use an official Nginx runtime as a parent image
FROM nginx:latest

# Set working directory to /var/www/html
WORKDIR /var/www/html

# Install PHP and other required packages
RUN apt-get update && \
    apt-get install -y php-fpm php-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy PHP-FPM configuration file
COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# Copy default Nginx site configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy index.php file to /var/www/html
COPY index.php /var/www/html/index.php

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx and PHP-FPM services
CMD service php7.4-fpm start && nginx -g "daemon off;"
