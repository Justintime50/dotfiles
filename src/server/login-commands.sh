#!/bin/sh

# Wait for the system and services to boot before attempting to do anything
sleep 30

# Start Harvey
cd "$HOME"/git/personal/harvey && just prod
