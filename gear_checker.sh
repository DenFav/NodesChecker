#!/bin/bash

gear_status=$(get_status)

shopt -s nocasematch

if [[ $gear_status =~ "active" ]]; then
echo "Gear is ok✅"
 else 
echo "Check gear node❌" 
fi

shopt -u nocasematch

function get_status() {
    STATUS=$(docker exec -t shardeum-dashboard operator-cli status | grep state | awk '{ print $2 }')
    echo "${STATUS}"
}