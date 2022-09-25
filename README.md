<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About ODA-API

ODA API base on Laravel framework

 - PHP version: "^7.3|^8.0",
 - MSQL version: "5.7"

## Project Required

- Docker: Docker version 20.10.14
- Docker Compose: docker-compose version 1.29.2

## Run project:

- Build docker compose: docker-compose build
- Run Containers: docker-compose up -d
- Exec to application: docker-compose exec app bash
- Run composer install
- Home page: localhost:3000 (default port 3000, please see this in env file with key APP_PORT)

## Laravel Passport
 - Migrate database: php artisan migrate (make  sure you have install passport)
 - Run: php artisan passport:install
 
## Laravel Horizon
 - Install Horizon: php artisan horizon
 - Dashboard: localhost/horizon
 - See more at: https://laravel.com/docs/8.x/horizon
 - See log: horizon.log

 ## Laravel Telescope

- Install Telescope: php artisan telescope:install 
- Run migration: php artisan migrate
- Dashboard: localhost/telescope

- See more at: https://laravel.com/docs/8.x/telescope
## License Laravel

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
