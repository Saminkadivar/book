FROM php:8.2-apache

# Install mysqli and other needed extensions
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Copy all files into container
COPY . /var/www/html/

# Expose the port
EXPOSE 80
