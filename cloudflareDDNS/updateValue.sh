#!/usr/bin/env bash

source "./values"
CURRENT_IP=$(curl -s https://ipinfo.io/ip)

if [[ -z "$CURRENT_IP" ]]; then
    echo "Failed to fetch current IP."
    exit 1
fi

if grep -q "VALUE=\"$CURRENT_IP\"" "./values"; then
    echo "Current IP is already set in values file."
    exit 1
fi

sed -i "s/^VALUE=\".*\"/VALUE=\"$CURRENT_IP\"/" "./values"

echo "Updated VALUE in values file to $CURRENT_IP"