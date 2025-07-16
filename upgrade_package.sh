#!/bin/bash

# File containing list of package names (one per line)
PACKAGE_FILE="packages.txt"

# Log file for results
LOG_FILE="upgrade-results-$(date +%F_%H-%M-%S).txt"

# Update package index first
echo "Running apt update..." | tee -a "$LOG_FILE"
sudo apt update >> "$LOG_FILE" 2>&1

# Upgrade each package individually
while read -r pkg; do
    if [[ -n "$pkg" ]]; then
        echo "----------------------------------------" | tee -a "$LOG_FILE"
        echo "Upgrading package: $pkg" | tee -a "$LOG_FILE"
        sudo apt install -y "$pkg" >> "$LOG_FILE" 2>&1
        if [[ $? -eq 0 ]]; then
            echo "✔️  Success: $pkg" | tee -a "$LOG_FILE"
        else
            echo "❌  Failed: $pkg" | tee -a "$LOG_FILE"
        fi
    fi
done < "$PACKAGE_FILE"

echo "All done. Log saved to $LOG_FILE"

