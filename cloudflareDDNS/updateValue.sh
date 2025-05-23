#!/usr/bin/env bash

# Load variables from values file
source "$(dirname "$0")/values"

# Get current public IP
CURRENT_IP=$(curl -s https://ipinfo.io/ip)

# Exit if curl failed
if [[ -z "$CURRENT_IP" ]]; then
    echo "Failed to fetch current IP."
    exit 1
fi

# Update VALUE in values file
sed -i "s/^VALUE=\".*\"/VALUE=\"$CURRENT_IP\"/" "$(dirname "$0")/values"

echo "Updated VALUE in values file to $CURRENT_IP"