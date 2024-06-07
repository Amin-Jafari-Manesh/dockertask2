composer install
chown -R www-data:www-data /var/www
composer install
php artisan migrate
php artisan key:generate
exit
