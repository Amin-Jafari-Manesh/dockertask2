# Dockerized laravel Project with Docker Compose

This is a Dockerized PHP project using Docker Compose. Follow the instructions below to set up the project.

## Prerequisites

- Docker
- Docker Compose

## Building the Docker Image and Running the Container

To build the Docker image and run the container, navigate to the project directory and run the following command:

```bash
cp .env.example .env
docker-compose up -d --build
```

This command will build the Docker image using the Dockerfile and docker-compose.yml in the current directory, and then start the container in detached mode.  
Setting Up the Application
After the Docker container is running, you need to set up the application. Run the following commands:

```bash
docker exec -it <container_id> bash
chown -R www-data:www-data /var/www
composer install
php artisan migrate
php artisan key:generate
```

These commands will install the project dependencies, copy the .env.example file to .env, generate an application key, and run the database migrations.

Replace <container_id> with the ID of your running Docker container. You can get the ID by running docker ps.
