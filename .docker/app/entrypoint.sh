#!/bin/bash

cp .env.example .env
composer install
php artisan key:generate
php artisan migrate --force
php artisan config:cache
chown -R $USER:www-data /var/www/storage &&\
  chown -R $USER:www-data /var/www/bootstrap/cache &&\
  chmod -R 775 /var/www/storage &&\
  chmod -R 775 /var/www/bootstrap/cache

php-fpm