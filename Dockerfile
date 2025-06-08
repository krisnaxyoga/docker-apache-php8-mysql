FROM php:8.4-apache

# Update dan install package yang dibutuhkan
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    libzip-dev \
    python3-certbot-apache \
    certbot \
    gnupg \
    ca-certificates

# Install Node.js dan npm dari NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Install ekstensi PHP
RUN docker-php-ext-install pdo pdo_mysql zip

# Aktifkan mod_rewrite Apache
RUN a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
