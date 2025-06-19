#!/bin/bash

read -p "Enter your name: " username
main_dir="submission_reminder_${username}"

mkdir -p "$main_dir"/{scripts,data,config}

# Create config.env
cat <<EOL > "$main_dir/config/config.env"
ASSIGNMENT=Assignment1
EOL

# Create functions.sh
cat <<'EOL' > "$main_dir/scripts/functions.sh"
check_reminders() {
    while IFS=, read -r name status; do
        if [[ "$status" == "Not Submitted" ]]; then
            echo "$name has not submitted \$ASSIGNMENT"
        fi
    done < ../data/submissions.txt
}
EOL

# Create reminder.sh
cat <<'EOL' > "$main_dir/scripts/reminder.sh"
echo "Reminder logic loaded..."
EOL

# Create submissions.txt with 7 entries
cat <<EOL > "$main_dir/data/submissions.txt"
Aline Uwase,Submitted
Eric Nshimiyimana,Not Submitted
Jean Bosco Mugisha,Not Submitted
Clarisse Ingabire,Submitted
Patrick Habimana,Not Submitted
Diane Uwera,Submitted
Emmanuel Niyonzima,Not Submitted
EOL

# Create startup.sh
cat <<'EOF' > "$main_dir/scripts/startup.sh"
#!/bin/bash
cd "$(dirname "$0")"
source functions.sh
source reminder.sh
source ../config/config.env

echo "🔔 Reminder for assignment: \$ASSIGNMENT"
check_reminders
EOF

# Make .sh files executable
chmod +x "$main_dir/scripts/"*.sh

echo "✅ Environment created successfully in: $main_dir"
