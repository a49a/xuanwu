import netaddr
import sys

sys.argv.pop(0)
netmask = "255.255.255.0"

for ip in sys.argv:
    address = f"{ip}/{netmask}"
    try:
        rack = netaddr.IPNetwork(address).network
        print(f"/{rack}")
    except:
        print("/rack-unknown")