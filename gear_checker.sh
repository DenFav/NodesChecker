#!/bin/bash

get_status() {
    STATUS=$(sudo systemctl status gear | grep -i active | awk '{print $2}')
    echo "${STATUS}"
}

gear_status=$(get_status)

if [[ $gear_status =~ "active" ]]; then
echo "Gear is ok✅"
 else 
echo "Check Gear node❌" 
fi
