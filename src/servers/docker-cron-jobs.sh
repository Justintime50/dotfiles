#!/bin/bash

# Docker exec commands MUST be wrapped in a script like this to work on cron

golf_rocket_container_id=$(docker ps --filter "name=golf-rocket" --format "{{.ID}}" | head -n 1)
docker exec "$golf_rocket_container_id" sh -c "php artisan schedule:run"
