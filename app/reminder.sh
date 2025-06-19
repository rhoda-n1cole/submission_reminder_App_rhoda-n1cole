
# Source environment variables and helper functions
source "$(dirname "$0")/../config/config.env"
source "$(dirname "$0")/../modules/functions.sh"

# Path to the submissions file
submissions_file="$(dirname "$0")/../assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"
