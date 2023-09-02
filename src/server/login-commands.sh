#!/bin/sh

# Wait for the system and services to boot before attempting to do anything
sleep 30

# Ensure SSH Agent is loaded and authenticated (SSH is needed for various cron tasks)
ssh-add -l

# Start Harvey
cd "$HOME"/git/personal/harvey && just prod
