# Only one single output remains unspent from block 123,321. What address was it sent to?

block_height=123321
blockhash=$(bitcoin-cli getblockhash "$block_height")

tx_ids=$(bitcoin-cli getblock "$blockhash" | jq -r '.tx[]')

for tx in $tx_ids; do
  unspent=$(bitcoin-cli gettxout "$tx" 0)

  if [ "$unspent" != "" ]; then
    address=$(bitcoin-cli getrawtransaction "$tx" true | jq -r '.vout[0].scriptPubKey.address')
    echo $address
    exit
  fi
done
