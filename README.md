User Management Simulation Script
 Overview

This Bash script simulates user creation and management in a Linux system.
It reads user details from an input file (users.txt), generates random passwords for each user, and logs the operations for record-keeping — without actually creating any system users.

The script is useful for:

Testing or simulating bulk user creation

Generating secure passwords for a list of users

Practicing file handling and logging in Bash scripting

 Folder Structure
project/
│
├── users.txt                  # Input file with user data
├── user_management.sh         # This script
├── secure/
│   └── user_passwords.txt     # Stores generated passwords
├── logs/
│   └── user_management.log    # Logs all simulated actions

 How It Works

Setup

Creates two directories if they don’t exist:

./secure for password storage

./logs for logging

Creates (or updates) two files:

user_passwords.txt — stores usernames and their generated passwords.

user_management.log — logs every simulated action with timestamps.

Both files are secured with file permissions 600 (only the owner can read/write).

Reading Input

The script reads each line from users.txt.

It skips blank lines and lines starting with # (comments).

User Processing

Each line should have the format:

username;group1,group2,group3


Example:

light;developers,designers
siyoni;manoj


For each user:

A random password is generated using OpenSSL.

The username and password are stored in ./secure/user_passwords.txt.

The simulated action is logged in ./logs/user_management.log.

Logging

Every user processed is recorded with a timestamp:

YYYY-MM-DD HH:MM:SS - Simulated user 'light' with groups: developers,designers


Completion

When finished, the script prints:

Simulation complete. Check logs in ./logs/user_management.log

 Example Input (users.txt)
 Format: username;group1,group2,group3

alice;developers,designers
bob;admins
charlie;support,qa

 How to Run
 Make the script executable
chmod +x user_management.sh

 Run the script
./user_management.sh

 Output Example
secure/user_passwords.txt
alice:q1G8YtN4mR8=
bob:zV+gRtLmAqPo=
charlie:ZbS7Nh2ErkQ=

logs/user_management.log
2025-11-13 14:45:11 - Simulated user 'light' with groups: sudo,dev,www-data
2025-11-13 14:45:12 - Simulated user 'siyoni' with groups: sudo
2025-11-13 14:45:13 - Simulated user 'manoj' with groups: dev,www-data

Requirements

Linux or macOS terminal

Bash shell

OpenSSL installed (sudo apt install openssl on Debian/Ubuntu)

 Notes

This script does not actually create users — it only simulates the process.

Passwords are stored in plaintext for demonstration purposes.
For real implementations, store hashes instead.

Always protect the secure/ directory with proper permissions.

 Author

preethi
