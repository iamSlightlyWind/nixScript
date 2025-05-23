#!/bin/bash

if ! "./updateValue.sh"; then
    echo "updateValue.sh failed, skipping this attempt."
    exit 1
fi

source "./values"

curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records/$ENTRY" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$NAME\",\"content\":\"$VALUE\",\"ttl\":1,\"proxied\":false}"