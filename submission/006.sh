# Which tx in block 257,343 spends the coinbase output of block 256,128?

block2_id=256128
block1_id=257343

coinbase_txid=$(bitcoin-cli getblockhash $block2_id | xargs -I{} bitcoin-cli getblock {} | jq -r '.tx[0]')
block=$(bitcoin-cli getblockhash $block1_id | xargs -I{} bitcoin-cli getblock {} | jq -r '.tx[]')
spender=""
for txid in $block; do
  inputs=$(bitcoin-cli getrawtransaction "$txid" 1 | jq -r '.vin[].txid')
  if [[ $inputs == *"$coinbase_txid"* ]]; then
    spender=$txid
    break
  fi
done

echo $spender
