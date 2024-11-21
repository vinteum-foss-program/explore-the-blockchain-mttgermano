# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

txid="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"

public_keys=$(bitcoin-cli getrawtransaction "$txid" 1 | jq -r '.vin[].txinwitness[1]')

str='['
str+=$(echo "$public_keys" | while read public_key; do echo "\"$public_key\","; done)
str="${str%,}]"

multisig=$(bitcoin-cli createmultisig 1 "$str")
p2sh_address=$(echo "$multisig" | jq -r '.address')
echo $p2sh_address
