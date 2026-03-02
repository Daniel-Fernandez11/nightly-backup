#!/bin/bash

# NightlyBackup

LOG_FILE="$HOME/nightly-backup.log"
MAX_BACKUPS=3

validate_arguments() {
    if [ -z "$1" ]; then
        echo "Error: source directory is missing"
        echo "Usage: $0 source_directory backup_directory"
        echo "$(date) ERROR: source directory missing" >> "$LOG_FILE"
        exit 1
    fi

    if [ -z "$2" ]; then
        echo "Error: backup directory is missing"
        echo "Usage: $0 source_directory backup_directory"
        echo "$(date) ERROR: backup directory missing" >> "$LOG_FILE"
        exit 1
    fi
}

check_directories() {
    if [ ! -d "$1" ]; then
        echo "$(date) ERROR: source directory does not exist" >> "$LOG_FILE"
        exit 1
    fi

    if [ ! -d "$2" ]; then
        mkdir -p "$2" || {
            echo "$(date) ERROR: cannot create backup directory" >> "$LOG_FILE"
            exit 1
        }
    fi
}

create_backup() {
    local src="$1"
    local dest="$2"
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

    if tar -czf "$dest/$BACKUP_NAME" -C "$(dirname "$src")" "$(basename "$src")"; then
        echo "$(date) SUCCESS: Backup created $BACKUP_NAME" >> "$LOG_FILE"
    else
        echo "$(date) ERROR: Backup failed" >> "$LOG_FILE"
        exit 1
    fi
}

rotate_backups() {
    local dest="$1"
    local backups
    backups=( "$dest"/backup_*.tar.gz )
    local count=${#backups[@]}

    if [ "$count" -gt "$MAX_BACKUPS" ]; then
        for (( i=MAX_BACKUPS; i<count; i++ )); do
            rm -f "${backups[$i]}"
            echo "$(date) INFO: Deleted old backup $(basename "${backups[$i]}")" >> "$LOG_FILE"
        done
    fi
}

main() {
    validate_arguments "$@"
    SRC_DIR="$1"
    BACKUP_DIR="$2"
    check_directories "$SRC_DIR" "$BACKUP_DIR"
    create_backup "$SRC_DIR" "$BACKUP_DIR"
    rotate_backups "$BACKUP_DIR"
}

main "$@"
