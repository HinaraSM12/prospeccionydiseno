# Imagen oficial de PHP 8.3 con Apache
FROM php:8.3-apache

# Dependencias de sistema (sin mcrypt: eliminado en PHP 8)
RUN apt-get update && apt-get install -y --no-install-recommends \
    zip \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Habilitar mod_rewrite de Apache (muy usado en proyectos viejos)
RUN a2enmod rewrite

# Instalar Composer 2.2
RUN curl -sS https://getcomposer.org/installer | php -- --version=2.2.21 --install-dir=/usr/local/bin --filename=composer

# Copia tu proyecto al contenedor
WORKDIR /var/www/html
COPY . /var/www/html

# Permisos (a veces necesarios en proyectos antiguos)
RUN chown -R www-data:www-data /var/www/html
