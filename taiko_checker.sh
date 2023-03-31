#!/bin/bash

get_status() {
    STATUS=$(docker-compose -f $HOME/simple-taiko-node/docker-compose.yml logs --tail=100 | grep -i --color=='auto' error | grep -wv -i -e trie | grep -wv -i -e L1_ | grep -wv -i -e L1_ALREADY_PROVEN | grep -wv -i -e 'failed to fetch L2 parent block:')
    echo "${STATUS}"
}

node_status=$(get_status)

if [ -z "$node_status" ]; then
echo "Taiko looks good, no errors✅"
 else 
echo "Some errors in logs. Check Taiko node❌" 
fi