# NightlyBackup

NightlyBackup is a Bash script designed to create compressed backups of a specified directory and store them in a defined backup location.

Each backup is generated with a timestamp in its filename, allowing multiple versions to coexist without overwriting previous backups. 

The script includes automatic rotation of old backups, ensuring that only a configurable number of the most recent backups are retained, and logs all operations and errors to a log file. 

The script can be executed manually or scheduled using cron for automated nightly backups, making it appropriate for Linux system administration and backup automation.

# Purpose

Regular backups are essential in Linux systems to prevent data loss and support recovery processes.

NightlyBackup provides a simple and reliable way to automate directory backups, manage backup retention, and maintain execution logs with minimal configuration.

# Usage

./backup.sh source_directory backup_directory

# How It Works

The script validates input arguments, verifies that the source directory exists, creates the backup destination directory if necessary, generates a compressed tar.gz backup with a timestamp, removes old backups beyond the configured limit, and records all actions and errors in a log file.

#Requirements

Bash shell 
Linux system
tar utility
cron (optional)

# Author

Jose Daniel Fernandez
GitHub: https://github.com/Daniel-Fernandez11
