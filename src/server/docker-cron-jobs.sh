#!/bin/bash

# Docker exec commands MUST be wrapped in a script like this to work on cron

docker exec golf-rocket-golf-rocket-1 sh -c "php artisan schedule:run"
