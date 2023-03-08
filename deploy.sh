#! /usr/bin/bash

# To load the variables in the .env file
unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)
set -a
. ./.env
set +a

local=false
rpc_url=$BSC_TESTNET_RPC_URL
api_key=$BSCSCAN_API_KEY

while getopts 'l' flag; do
  case "${flag}" in
    l) local='true' ;;
    *) print_usage
       exit 1 ;;
  esac
done

# if is local
# if !isLocal $BSC_TESTNET_RPC_URL && verify

if [ $local = true ]
then
    forge script script/Deploy.s.sol:D_Faucet --fork-url http://localhost:8545 --broadcast
else
    # To deploy and verify our contract on bsc testnet
    forge script script/Deploy.s.sol:D_Faucet --rpc-url $rpc_url --broadcast --etherscan-api-key $api_key --verify -vvvv

fi