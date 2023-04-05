#!/bin/bash

cd $HOME/bundlr/validator-rust
address=$(cargo run --message-format json --bin wallet-tool show-address --wallet wallet.json | grep address |  jq -r .address)
balance=$(testnet-cli balance "${address}" 2>&1 | grep $address | awk '{ print $7 }' )
validator=$(npx @bundlr-network/testnet-cli check RkinCLBlY4L5GZFv8gCFcrygTyd5Xm91CzKlR6qxhKA "${address}" 2>&1 | grep $address)
cd ~

if [[ "$balance" -eq "0" && "$validator" == *"is a validator for contract"*  ]]; then
echo "Bundler looks good✅"
 else 
echo "Check Bundler node❌" 
fi