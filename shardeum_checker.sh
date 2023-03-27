#!/bin/bash

get_status() {
    STATUS=$(docker exec -t shardeum-dashboard operator-cli status | grep state | awk '{ print $2 }')
    echo "${STATUS}"
}

shardeum_status=$(get_status)

if [[ $shardeum_status =~ "active" ]]; then
echo "Shardeum is ok✅"
 else 
echo "Check Shardeum node❌" 
fi
