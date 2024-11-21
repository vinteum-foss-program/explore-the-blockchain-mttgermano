# How many new outputs were created by block 123,456?

hash=$(bitcoin-cli getblockhash 123456)
block=$(bitcoin-cli getblock "$hash")
txids=$(echo $block | jq -r '.tx[]')
new_outputs=0

for txid in $txids; do
  vout_count=$(bitcoin-cli getrawtransaction "$txid" 1 | jq '.vout | length')
  new_outputs=$((new_outputs + vout_count))
done

echo $new_outputs
