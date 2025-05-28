# Usa la imagen base de PHP 8.2 con Apache en Debian Bookworm
# Laravel 10 requiere PHP ^8.1, así que 8.2 es una opción segura y moderna.
FROM php:8.2-apache-bookworm

# Establece el directorio de trabajo dentro del contenedor.
# Tu docker-compose.yml lo define como /var/www/
WORKDIR /var/www/

# Instala las dependencias del sistema necesarias para las extensiones PHP,
# y herramientas como git y unzip (requeridas por Composer).
# Incluye también librerías para extensiones comunes de Laravel (GD, MySQL).
RUN apt-get update && \
    apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Instala las extensiones PHP requeridas por la mayoría de las aplicaciones Laravel.
# pdo y pdo_mysql son para la base de datos, gd para procesamiento de imágenes,
# zip paraComposer y opcache para optimización de rendimiento.
RUN docker-php-ext-install -j$(nproc) \
    pdo \
    pdo_mysql \
    gd \
    zip \
    opcache

# Instala Composer globalmente en el contenedor.
# Se copia desde una imagen oficial de Composer, lo que garantiza que sea la última versión.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia los archivos de tu aplicación Laravel al directorio de trabajo del contenedor.
# Aunque el volumen en docker-compose.yml montará tu código local,
# esta copia asegura que composer install pueda ejecutarse durante la construcción
# incluso si no hay un volumen montado temporalmente.
COPY . /var/www/

# Instala las dependencias de Composer definidas en tu composer.json.
# --no-dev: Excluye las dependencias de desarrollo (ideal para imágenes de producción).
# --optimize-autoloader: Mejora la velocidad de carga de tu aplicación en producción.
RUN composer install --no-dev --optimize-autoloader

# Configura los permisos de escritura para los directorios 'storage' y 'bootstrap/cache'.
# Estos directorios son cruciales para que Laravel pueda escribir logs, caché, etc.
# 'www-data' es el usuario bajo el cual Apache/PHP corre dentro del contenedor Debian.
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache && \
    chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Habilita el módulo 'mod_rewrite' de Apache, indispensable para las URLs amigables de Laravel.
RUN a2enmod rewrite

# Copia la configuración personalizada de Apache para tu aplicación.
# Este archivo (000-default.conf) debe estar junto a tu Dockerfile en ./api/.
# Sobreescribe la configuración predeterminada de Apache.
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
