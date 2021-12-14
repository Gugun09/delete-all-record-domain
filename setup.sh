#!/bin/bash
#script by gugun

EMAIL=me@gmail.com
KEY=11111111111111111111111111
ZONE_ID=2222222222222222222222222

curl -sLX GET https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records?per_page=500 \
     -H "X-Auth-Email: ${EMAIL}" \
     -H "X-Auth-Key: ${KEY}" \
     -H "Content-Type: application/json" | jq .result[].id |  tr -d '"' | (
  while read id; do
    curl -sLX DELETE https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${id} \
      -H "X-Auth-Email: ${EMAIL}" \
      -H "X-Auth-Key: ${KEY}" \
      -H "Content-Type: application/json"
  done
  )
