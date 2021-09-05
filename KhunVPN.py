#!/usr/bin/env python

import requests, os, sys, tempfile, subprocess, base64, time

"""
Based on the OpenVPN client and VPNGate servers
__author__ = "Keany Vy KHUN"
__copyright__ = "Copyright 2021, KhunVPN"
__license__ = "MIT License"
__version__ = "1.0"
__maintainer__ = "@thisiskeanyvy"
__email__ = "drwho@keanyvy.onmicrosoft.com"
"""

"""
Servers :
- South Korea = KR
- United State = US
- Taiwan = TW
- Russia = RN
- Japan = JP
"""

def servers():
    if len(sys.argv) != 2:
        print("--- Welcome to KhunVPN ! ---\n")
        print('usage: sudo python3 ' + sys.argv[0] + ' [country name | country code]')
        exit(1)
    country = sys.argv[1]
    #verify country
    if len(country) == 2:
        i = 6 # short name for country
    elif len(country) > 2:
        i = 5 # long name for country
    else:
        print('The country code is too short...')
        exit(1)
    #get data from server
    try:
        vpn_data = requests.get('http://www.vpngate.net/api/iphone/').text.replace('\r','')
        servers = [line.split(',') for line in vpn_data.split('\n')]
        labels = servers[1]
        labels[0] = labels[0][1:]
        servers = [s for s in servers[2:] if len(s) > 1]
    except:
        print('Unable to get data from VPN servers...')
        exit(1)
    #get server country
    desired = [s for s in servers if country.lower() in s[i].lower()]
    found = len(desired)
    print('Found ' + str(found) + ' servers for country ' + country)
    if found == 0:
        exit(1)
    #get server who support OpenVPN
    supported = [s for s in desired if len(s[-1]) > 0]
    print(str(len(supported)) + ' of these servers support OpenVPN')
    score(supported,labels)

def score(supported,labels):
    #We pick the best servers by score
    winner = sorted(supported, key=lambda s: float(s[2].replace(',','.')), reverse=True)[0]
    #print best server
    print("\n== Best server ==")
    pairs = list(zip(labels, winner))[:-1]
    for (l, d) in pairs[:4]:
        print(l + ': ' + d)
    #print info from the best server
    print(pairs[4][0] + ': ' + str(float(pairs[4][1]) / 10**6) + ' MBps')
    print("Country: " + pairs[5][1])
    connect(winner)

def connect(winner):
    print("\nLaunching VPN...")
    path = "/etc/openvpn/update-resolv.conf"
    _ = tempfile.mkstemp()
    #write data of the vpn configuration
    file = open(path, 'w')
    file.write(base64.b64decode(winner[-1]).decode('utf-8'))
    file.close()
    #launch openvpn command
    x = subprocess.Popen(['sudo', 'openvpn', '--config', path])
    kill(x)

def kill(x):
    try:
        while True:
            time.sleep(600)
    #termination with Ctrl+C
    except:
        try:
            x.kill()
        except:
            pass
        while x.poll() != 0:
            time.sleep(1)
        print('\nVPN terminated')

if __name__ == "__main__":
    servers()
