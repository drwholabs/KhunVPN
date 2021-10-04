# KhunVPN
A free vpn that uses the OpenVPN client with open-source servers around the world.

## What is KhunVPN?

The KhunVPN client is a tool to bypass DNS blocks and also network censorship and surveillance. It is capable of routing all network traffic from the machine to the output node as well as encrypting this communication and the data passing through it.

Even if you are on a school, company or public Wi-Fi network you can establish a connection to the VPN server.

### How does it work?

Developed in several languages the client sends a GET request to the VPNGate servers in order to obtain a list of active OpenVPN servers. It then splits the collected data and sorts it to indicate the fastest VPN server.

Once the server is selected it decodes the base64 configuration data into UFT-8 and writes the contents to a file called <u>update-resolv.conf</u>. It then establishes a connection using OpenVPN and the configuration file which contains keys, certificates and other server information.

## Supported OpenVPN servers

### With specific country :

- [x] Republic of Korea
- [ ] Iran (ISLAMIC Republic Of)
- [x] United States
- [ ]  France
- [x]  Japan
- [ ] Taiwan
- [ ] India
- [ ] China
- [ ]  Indonesia
- [x] Viet Nam
- [ ] United Arab Emirates
- [ ] Thailand
- [x] Russian Federation
- [ ] Philippines

------

## Requirements for the client

- OpenVPN Client
- Administrator permissions for Linux

## Setting up the environment

- Clone the github repository

```shell
$ git clone https://github.com/drwholabs/KhunVPN.git
```

- Go to the tool's folder

```shell
$ cd KhunVPN/
```

- Choose your operating system type

1. If you are on Linux :
```shell
$ cd linux/
```
2. If your are on Windows :
```shell
$ cd windows/
```

- Choose your programming language type

1. If you develop in bash :
```shell
$ cd bash-dev/
```
2. If you develop in python :
```shell
$ cd python-dev/
```

- Debug the client during development

1. If you develop in bash :
```shell
$ sudo ./KhunVPN
```
2. If you develop in python :
```shell
$ sudo python3 KhunVPN.py
```

### Prerequisites for the Python version :

- Python >= 3
  - Requests (libraries)
- Pip >= 3

------

## Using the command line software :

### With the Bash version :

- Enter the name of a country or its code to get an ip located in the specified region.

```shell
$ sudo ./KhunVPN [country name | country code]
```
```shell

--- Welcome to KhunVPN ! ---

% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
Dload  Upload   Total   Spent    Left  Speed
100 1211k  100 1211k    0     0   220k      0  0:00:05  0:00:05 --:--:--  291k

== Best server ==
HostName: public-vpn-232
IP: 219.100.37.219
Score: 2631026
Ping: 10
Speed: 16.55 MBps
Country: Japan


Launching VPN...
2021-09-11 23:50:25 DEPRECATED OPTION: --cipher set to 'AES-128-CBC' but missing in --data-ciphers (AES-256-GCM:AES-128-GCM). Future OpenVPN version will ignore --cipher for cipher negotiations. Add 'AES-128-CBC' to --data-ciphers or change --cipher 'AES-128-CBC' to --data-ciphers-fallback 'AES-128-CBC' to silence this warning.
2021-09-11 23:50:25 OpenVPN 2.5.3 [git:makepkg/ecaf88f8a4e75856+] x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Jun 18 2021
2021-09-11 23:50:25 library versions: OpenSSL 1.1.1l  24 Aug 2021, LZO 2.10
2021-09-11 23:50:25 WARNING: No server certificate verification method has been enabled.  See http://openvpn.net/howto.html#mitm for more info.
2021-09-11 23:50:25 TCP/UDP: Preserving recently used remote address: [AF_INET]219.100.37.219:443
2021-09-11 23:50:25 Socket Buffers: R=[131072->131072] S=[16384->16384]
2021-09-11 23:50:25 Attempting to establish TCP connection with [AF_INET]219.100.37.219:443 [nonblock]
2021-09-11 23:50:25 TCP connection established with [AF_INET]219.100.37.219:443
2021-09-11 23:50:25 TCP_CLIENT link local: (not bound)
2021-09-11 23:50:25 TCP_CLIENT link remote: [AF_INET]219.100.37.219:443
2021-09-11 23:50:26 TLS: Initial packet from [AF_INET]219.100.37.219:443, sid=bb512b24 d003c4a0
2021-09-11 23:50:26 VERIFY OK: depth=2, C=US, ST=New Jersey, L=Jersey City, O=The USERTRUST Network, CN=USERTrust RSA Certification Authority
2021-09-11 23:50:26 VERIFY OK: depth=1, C=GB, ST=Greater Manchester, L=Salford, O=Sectigo Limited, CN=Sectigo RSA Domain Validation Secure Server CA
2021-09-11 23:50:26 VERIFY OK: depth=0, CN=*.opengw.net
2021-09-11 23:50:27 Control Channel: TLSv1.3, cipher TLSv1.3 TLS_AES_256_GCM_SHA384, peer certificate: 2048 bit RSA, signature: RSA-SHA256
2021-09-11 23:50:27 [*.opengw.net] Peer Connection Initiated with [AF_INET]219.100.37.219:443
2021-09-11 23:50:28 SENT CONTROL [*.opengw.net]: 'PUSH_REQUEST' (status=1)
2021-09-11 23:50:31 PUSH: Received control message: 'PUSH_REPLY,ping 3,ping-restart 10,ifconfig 10.246.66.41 10.246.66.42,dhcp-option DNS 10.246.254.254,dhcp-option DNS 8.8.8.8,route-gateway 10.246.66.42,redirect-gatewaydef1'
2021-09-11 23:50:31 OPTIONS IMPORT: timers and/or timeouts modified
2021-09-11 23:50:31 OPTIONS IMPORT: --ifconfig/up options modified
2021-09-11 23:50:31 OPTIONS IMPORT: route options modified
2021-09-11 23:50:31 OPTIONS IMPORT: route-related options modified
2021-09-11 23:50:31 OPTIONS IMPORT: --ip-win32 and/or --dhcp-option options modified
2021-09-11 23:50:31 Using peer cipher 'AES-128-CBC'
2021-09-11 23:50:31 Outgoing Data Channel: Cipher 'AES-128-CBC' initialized with 128 bit key
2021-09-11 23:50:31 Outgoing Data Channel: Using 160 bit message hash 'SHA1' for HMAC authentication
2021-09-11 23:50:31 Incoming Data Channel: Cipher 'AES-128-CBC' initialized with 128 bit key
2021-09-11 23:50:31 Incoming Data Channel: Using 160 bit message hash 'SHA1' for HMAC authentication
2021-09-11 23:50:31 net_route_v4_best_gw query: dst 0.0.0.0
2021-09-11 23:50:31 net_route_v4_best_gw result: via 192.168.1.1 dev wlp1s0
2021-09-11 23:50:31 ROUTE_GATEWAY 192.168.1.1/255.255.255.0 IFACE=wlp1s0 HWADDR=24:41:8c:d1:ad:3a
2021-09-11 23:50:31 TUN/TAP device tun0 opened
2021-09-11 23:50:31 net_iface_mtu_set: mtu 1500 for tun0
2021-09-11 23:50:31 net_iface_up: set tun0 up
2021-09-11 23:50:31 net_addr_ptp_v4_add: 10.246.66.41 peer 10.246.66.42 dev tun0
2021-09-11 23:50:31 net_route_v4_add: 219.100.37.219/32 via 192.168.1.1 dev [NULL] table 0 metric -1
2021-09-11 23:50:31 net_route_v4_add: 0.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:31 net_route_v4_add: 128.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:31 WARNING: this configuration may cache passwords in memory -- use the auth-nocache option to prevent this
2021-09-11 23:50:31 Initialization Sequence Completed
```
- To close the VPN connection press CTRL+C.

```shell
^C2021-09-11 23:50:41 event_wait : Interrupted system call (code=4)
2021-09-11 23:50:41 net_route_v4_del: 219.100.37.219/32 via 192.168.1.1 dev [NULL] table 0 metric -1
2021-09-11 23:50:41 net_route_v4_del: 0.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:41 net_route_v4_del: 128.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:41 Closing TUN/TAP interface
2021-09-11 23:50:41 net_addr_ptp_v4_del: 10.246.66.41 dev tun0
2021-09-11 23:50:41 SIGINT[hard,] received, process exiting
127.0.0.1
VPN terminated
```



### With the Python version :

- Enter the name of a country or its code to get an ip located in the specified region.

```shell
$ sudo python3 KhunVPN.py [country name | country code]
```
```shell

--- Welcome to KhunVPN ! ---

% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
Dload  Upload   Total   Spent    Left  Speed
100 1211k  100 1211k    0     0   220k      0  0:00:05  0:00:05 --:--:--  291k

== Best server ==
HostName: public-vpn-232
IP: 219.100.37.219
Score: 2631026
Ping: 10
Speed: 16.55 MBps
Country: Japan


Launching VPN...
2021-09-11 23:50:25 DEPRECATED OPTION: --cipher set to 'AES-128-CBC' but missing in --data-ciphers (AES-256-GCM:AES-128-GCM). Future OpenVPN version will ignore --cipher for cipher negotiations. Add 'AES-128-CBC' to --data-ciphers or change --cipher 'AES-128-CBC' to --data-ciphers-fallback 'AES-128-CBC' to silence this warning.
2021-09-11 23:50:25 OpenVPN 2.5.3 [git:makepkg/ecaf88f8a4e75856+] x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Jun 18 2021
2021-09-11 23:50:25 library versions: OpenSSL 1.1.1l  24 Aug 2021, LZO 2.10
2021-09-11 23:50:25 WARNING: No server certificate verification method has been enabled.  See http://openvpn.net/howto.html#mitm for more info.
2021-09-11 23:50:25 TCP/UDP: Preserving recently used remote address: [AF_INET]219.100.37.219:443
2021-09-11 23:50:25 Socket Buffers: R=[131072->131072] S=[16384->16384]
2021-09-11 23:50:25 Attempting to establish TCP connection with [AF_INET]219.100.37.219:443 [nonblock]
2021-09-11 23:50:25 TCP connection established with [AF_INET]219.100.37.219:443
2021-09-11 23:50:25 TCP_CLIENT link local: (not bound)
2021-09-11 23:50:25 TCP_CLIENT link remote: [AF_INET]219.100.37.219:443
2021-09-11 23:50:26 TLS: Initial packet from [AF_INET]219.100.37.219:443, sid=bb512b24 d003c4a0
2021-09-11 23:50:26 VERIFY OK: depth=2, C=US, ST=New Jersey, L=Jersey City, O=The USERTRUST Network, CN=USERTrust RSA Certification Authority
2021-09-11 23:50:26 VERIFY OK: depth=1, C=GB, ST=Greater Manchester, L=Salford, O=Sectigo Limited, CN=Sectigo RSA Domain Validation Secure Server CA
2021-09-11 23:50:26 VERIFY OK: depth=0, CN=*.opengw.net
2021-09-11 23:50:27 Control Channel: TLSv1.3, cipher TLSv1.3 TLS_AES_256_GCM_SHA384, peer certificate: 2048 bit RSA, signature: RSA-SHA256
2021-09-11 23:50:27 [*.opengw.net] Peer Connection Initiated with [AF_INET]219.100.37.219:443
2021-09-11 23:50:28 SENT CONTROL [*.opengw.net]: 'PUSH_REQUEST' (status=1)
2021-09-11 23:50:31 PUSH: Received control message: 'PUSH_REPLY,ping 3,ping-restart 10,ifconfig 10.246.66.41 10.246.66.42,dhcp-option DNS 10.246.254.254,dhcp-option DNS 8.8.8.8,route-gateway 10.246.66.42,redirect-gatewaydef1'
2021-09-11 23:50:31 OPTIONS IMPORT: timers and/or timeouts modified
2021-09-11 23:50:31 OPTIONS IMPORT: --ifconfig/up options modified
2021-09-11 23:50:31 OPTIONS IMPORT: route options modified
2021-09-11 23:50:31 OPTIONS IMPORT: route-related options modified
2021-09-11 23:50:31 OPTIONS IMPORT: --ip-win32 and/or --dhcp-option options modified
2021-09-11 23:50:31 Using peer cipher 'AES-128-CBC'
2021-09-11 23:50:31 Outgoing Data Channel: Cipher 'AES-128-CBC' initialized with 128 bit key
2021-09-11 23:50:31 Outgoing Data Channel: Using 160 bit message hash 'SHA1' for HMAC authentication
2021-09-11 23:50:31 Incoming Data Channel: Cipher 'AES-128-CBC' initialized with 128 bit key
2021-09-11 23:50:31 Incoming Data Channel: Using 160 bit message hash 'SHA1' for HMAC authentication
2021-09-11 23:50:31 net_route_v4_best_gw query: dst 0.0.0.0
2021-09-11 23:50:31 net_route_v4_best_gw result: via 192.168.1.1 dev wlp1s0
2021-09-11 23:50:31 ROUTE_GATEWAY 192.168.1.1/255.255.255.0 IFACE=wlp1s0 HWADDR=24:41:8c:d1:ad:3a
2021-09-11 23:50:31 TUN/TAP device tun0 opened
2021-09-11 23:50:31 net_iface_mtu_set: mtu 1500 for tun0
2021-09-11 23:50:31 net_iface_up: set tun0 up
2021-09-11 23:50:31 net_addr_ptp_v4_add: 10.246.66.41 peer 10.246.66.42 dev tun0
2021-09-11 23:50:31 net_route_v4_add: 219.100.37.219/32 via 192.168.1.1 dev [NULL] table 0 metric -1
2021-09-11 23:50:31 net_route_v4_add: 0.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:31 net_route_v4_add: 128.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:31 WARNING: this configuration may cache passwords in memory -- use the auth-nocache option to prevent this
2021-09-11 23:50:31 Initialization Sequence Completed
```
- To close the VPN connection press CTRL+C.

```shell
^C2021-09-11 23:50:41 event_wait : Interrupted system call (code=4)
2021-09-11 23:50:41 net_route_v4_del: 219.100.37.219/32 via 192.168.1.1 dev [NULL] table 0 metric -1
2021-09-11 23:50:41 net_route_v4_del: 0.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:41 net_route_v4_del: 128.0.0.0/1 via 10.246.66.42 dev [NULL] table 0 metric -1
2021-09-11 23:50:41 Closing TUN/TAP interface
2021-09-11 23:50:41 net_addr_ptp_v4_del: 10.246.66.41 dev tun0
2021-09-11 23:50:41 SIGINT[hard,] received, process exiting
127.0.0.1
VPN terminated
```

------

## Development Process

KhunVPN is released under the terms of the MIT License. See [Licence](https://github.com/drwholabs/KhunVPN/blob/main/LICENSE) for more information or see https://opensource.org/licenses/MIT.

### Licence MIT :

A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.

### Features :

- [x] OpenVPN support
- [x] Client for Linux
- [ ] Client for Windows
- [ ] Client for MacOs
- [ ] Client for Android
- [x] Bash version
- [ ] Python version
- [ ] C version
- [ ] Web extension version

------

