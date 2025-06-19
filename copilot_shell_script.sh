#!/bin/bash

read -p "Enter new assignment name: " new_assignment

cfg_path=$(find . -type f -path "./submission_reminder_*/config/config.env" | head -n 1)

if [ -z "$cfg_path" ]; then
    echo "config.env not found. Did you run create_environment.sh?"
    exit 1
fi

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=$new_assignment/" "$cfg_path"
echo "Assignment updated to '$new_assignment'"

bash "$(dirname "$cfg_path")/../scripts/startup.sh"
