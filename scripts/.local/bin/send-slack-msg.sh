#!/usr/bin/env bash
data="{\"text\": \"$@\"}"
curl -X POST -H 'Content-type: application/json' --data "$data" $(cat slack-webhook-url)
