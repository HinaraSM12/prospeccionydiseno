# Usa una imagen oficial de PHP 5.6 con Apache
FROM php:5.6-apache

# Cambiar repositorios a archive.debian.org (porque stretch ya está EOL)
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
    && sed -i '/stretch-updates/d' /etc/apt/sources.list

# Instala dependencias necesarias para compilar extensiones (ignorando firmas caducadas)
RUN apt-get update && apt-get install -y --allow-unauthenticated \
    libmcrypt-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-install mcrypt

# Habilitar mod_rewrite de Apache (muy usado en proyectos viejos)
RUN a2enmod rewrite

# Instalar Composer 2.2 (compatible con PHP 5.6)
RUN curl -sS https://getcomposer.org/installer | php -- --version=2.2.21 --install-dir=/usr/local/bin --filename=composer

# Copia tu proyecto al contenedor
WORKDIR /var/www/html
COPY . /var/www/html

# Permisos (a veces necesarios en proyectos antiguos)
RUN chown -R www-data:www-data /var/www/html
