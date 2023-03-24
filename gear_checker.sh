#!/bin/bash

gearst=$(sudo systemctl status gear)

shopt -s nocasematch

if [[ $gearst =~ " active " && $gearst != *"error"* && $gearst != *"invalid"* ]]; then
echo "Gear is ok✅"
 else 
echo "Check gear node❌" 
fi

shopt -u nocasematch
