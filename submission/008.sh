# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

OP_CHECKSIG="63"
PUBLIC_KEY_LENGTH="21"
PUBLIC_KEY_SIZE="66"

txid_input0="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
witness_script=$(bitcoin-cli getrawtransaction "$txid_input0" 1 | jq -r '.vin[0].txinwitness[2]')

public_key=$(echo $witness_script | sed -e "s/^${OP_CHECKSIG}${PUBLIC_KEY_LENGTH}//" -e "s/\(.\{${PUBLIC_KEY_SIZE}\}\).*$/\1/")

echo $public_key
