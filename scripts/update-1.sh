#!/usr/bin/env bash

echo "Sending some utxos to user1's address..."
set -e

ROOT=example
FEE=1000000

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
. "${SCRIPT_PATH}"/config-read.shlib; # load the config library functions

ROOT="$(config_get ROOT)";
UTXO_IX="$(config_get UTXO_IX)"
UTXO_VKEY="utxo-keys/utxo$UTXO_IX.vkey"
UTXO_SKEY="utxo-keys/utxo$UTXO_IX.skey"

pushd ${ROOT}

export CARDANO_NODE_SOCKET_PATH=node-spo1/node.sock

# Use the UTXO at given utxo's address.
UTXO_ADDR=$(cardano-cli address build --testnet-magic 42 --payment-verification-key-file "$UTXO_VKEY")
CHOSEN_UTXO=$(cardano-cli query utxo --address "$UTXO_ADDR" --testnet-magic 42 | tail -1 | awk '{printf "%s#%s %s \n", $1 , $2, $3}')

TXID0=$(echo ${CHOSEN_UTXO} | awk '{print $1}')
COINS_IN_INPUT=$(echo ${CHOSEN_UTXO} | awk '{print $2}')

echo "Using ${TXID0}, containing ${COINS_IN_INPUT} lovelace"

cardano-cli transaction build-raw \
            --babbage-era \
            --fee ${FEE} \
            --tx-in ${TXID0}\
            --tx-out $(cat addresses/user1.addr)+$((${COINS_IN_INPUT} / 2)) \
            --tx-out $(cat addresses/user1.addr)+$((${COINS_IN_INPUT} / 2 - ${FEE} - 2000000)) \
            --certificate-file addresses/user1-stake.reg.cert \
            --out-file tx2.txbody

cardano-cli transaction sign \
            --signing-key-file addresses/user1-stake.skey \
            --signing-key-file "$UTXO_SKEY" \
            --testnet-magic 42 \
            --tx-body-file  tx2.txbody \
            --out-file      tx2.tx

cardano-cli transaction submit --tx-file tx2.tx --testnet-magic 42

popd
