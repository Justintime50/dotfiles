#!/bin/sh
# shellcheck disable=SC1090,SC3028

# Wait for the system and services to boot before attempting to do anything
sleep 30

# Ensure SSH Agent is loaded and authenticated (SSH is needed for various cron tasks)
. "$HOME/.keychain/${HOSTNAME}-sh"
ssh-add -l

# Start Harvey
cd "$HOME"/git/personal/harvey && just prod
