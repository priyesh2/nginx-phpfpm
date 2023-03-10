FROM php:7.4-fpm

# Install required packages
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy PHP-FPM configuration file
COPY php-fpm.conf /usr/local/etc/php-fpm.d/www.conf

# Set working directory
WORKDIR /var/www/html

# Expose ports
EXPOSE 80 443

# Start Nginx and PHP-FPM services
CMD service nginx start && php-fpm
# Start Nginx and PHP-FPM services
CMD service php7.4-fpm start && nginx -g "daemon off;"
