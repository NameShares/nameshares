import os
import sys
import subprocess
import json
import datetime
import re #regex

ip = "127.0.0.1"
if len(sys.argv) > 1:
    ip = sys.argv[1]

print "This will create a new genesis block and make changes to your config files."
print "Continue? [y/n]"
entry = raw_input()
if entry != "y":
    sys.exit("Operation canceled")

input_log = []

input_log.append(">>> wallet_create default password")
input_log.append(">>> wallet_set_automatic_backups false ")

new_genesis = {
        "timestamp": datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S"),
        "market_assets": [],
        "names": [],
        "balances": [["PuVTvYER8hjVdqy6q5PUKSBRNdG9p2PTep", 1000],
                     ["PusXDPiS8aL7kCYoTDDc4gwCrWnwKdECte", 1000]],
        "bts_sharedrop": []
}

with open("libraries/blockchain/bts-sharedrop.json") as snapshot:
    items = json.loads(snapshot.read())
    for item in items:
        new_genesis["bts_sharedrop"].append(item)

for i in range(33):
    keys = json.loads(subprocess.check_output(["./programs/utils/bts_create_key"]))
    input_log.append(">>> wallet_import_private_key " + keys["wif_private_key"])

    acct = {
        "name": "init" + str(i),
        "owner": keys["public_key"],
        "delegate_pay_rate": 1
    }
    new_genesis["names"].append(acct)


input_log.append(">>> wallet_delegate_set_block_production ALL true")
input_log.append(">>> wallet_set_transaction_scanning true")

with open("libraries/blockchain/include/bts/blockchain/config.hpp") as config:
    with open("tmp_config", "w") as tmp:
        for line in config:
            if line.startswith("#define BTS_TEST_NETWORK_VERSION"):
                n = int(re.findall(r'\d+', line)[0])
                tmp.write("#define BTS_TEST_NETWORK_VERSION                            " + str(n+1) + " // autogenerated\n")
            else:
                tmp.write(line)
os.rename("tmp_config", "libraries/blockchain/include/bts/blockchain/config.hpp")


#with open("libraries/net/include/bts/net/config.hpp") as config:
#    with open("tmp_config", "w") as tmp:
#        for line in config:
#            if line.startswith("#define BTS_NET_TEST_SEED_IP"):
#                n = int(re.findall(r'\d+', line)[0])
#                tmp.write("#define BTS_NET_TEST_SEED_IP                            \"" + ip + "\" // autogenerated\n")
#            else:
#                tmp.write(line)
#os.rename("tmp_config", "libraries/net/include/bts/net/config.hpp")

old_balances = []
with open("libraries/blockchain/genesis.json") as genesis:
    old_balances = json.load(genesis)["balances"]

with open("libraries/blockchain/genesis.json", "w") as genesis:
    genesis.write(json.dumps(new_genesis, indent=4))

with open("testnet_setup_log.txt", "w") as log:
    for line in input_log:
        log.write(line + "\n")


subprocess.call(["make", "-j4"])
subprocess.call(["./programs/client/nameshares_client", "--input-log", "testnet_setup_log.txt", "--min-delegate-connection-count", "0"])

