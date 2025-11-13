INPUT_FILE="users.txt"
PASSWORD_FILE="./secure/user_passwords.txt"
LOG_FILE="./logs/user_management.log"

mkdir -p ./secure ./logs
touch "$PASSWORD_FILE" "$LOG_FILE"
chmod 600 "$PASSWORD_FILE" "$LOG_FILE"

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    line=$(echo "$line" | xargs)

    username=$(echo "$line" | cut -d';' -f1)
    groups=$(echo "$line" | cut -d';' -f2 | tr -d ' ')

    echo "Simulating creation of user: $username"
    echo "Groups: $groups"

    password=$(openssl rand -base64 12)
    echo "$username:$password" >> "$PASSWORD_FILE"
    log_action "Simulated user '$username' with groups: $groups"
done < "$INPUT_FILE"

echo "Simulation complete. Check logs in ./logs/user_management.log"