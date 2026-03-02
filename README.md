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

1 Validates input arguments
2 Verifies the source directory exists
3 Creates the backup destination if needed
4 Generates a compressed backup with a timestamp
5 Deletes old backups beyond the configured limit
6 Logs all operations to a log file

#Requirements

Bash shell 
Linux system
tar utility
cron (optional)

# Author

Jose Daniel Fernandez
GitHub: https://github.com/Daniel-Fernandez11
