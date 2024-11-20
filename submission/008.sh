# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

txid_input0="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
public_key=$(bitcoin-cli getrawtransaction "$txid_input0" 1 | jq -r '.vin[0].txinwitness[0]')

echo $public_key
