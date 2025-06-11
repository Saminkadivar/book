FROM php:8.2-apache

# Install mysqli
RUN docker-php-ext-install mysqli

# Set working directory
WORKDIR /var/www/html

# Copy everything
COPY . .

# Give permissions
RUN chmod -R 755 /var/www/html
