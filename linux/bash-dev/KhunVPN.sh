#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # #
# Based on the OpenVPN client and SoftEther servers #
# __author__ = "Keany Vy KHUN"                      #
# __copyright__ = "Copyright 2021, KhunVPN"         #
# __license__ = "MIT License"                       #
# __version__ = "1.0"                               #
# __maintainer__ = "@thisiskeanyvy"                 #
# __email__ = "admin@thisiskeanyvy.onmicrosoft.com" #
# # # # # # # # # # # # # # # # # # # # # # # # # # #

# - - - - - - - - - - - - - #
# Servers :                 #
# - South Korea = KR        #
# - United State = US       #
# - Taiwan = TW             #
# - Russia = RN             #
# - Japan = JP              #
# - - - - - - - - - - - - - #

#--- configuration variables ---#
argv=${#1} # gets the size of the bash argument
country=$1 # retrieves the bash argument
vpnup='cache/vpn_list.txt' # file that stores information about the available VPN servers
path_openvpn='/etc/openvpn'

mkdir 'cache/'

#--- VPN server connection function ---#
servers() {
  clear
  echo -e "\n--- Welcome to KhunVPN ! ---\n"
  if (($argv==0))
  then
    echo "usage: sudo ./KhunVPN.sh [country name | country code]"
    exit
  fi
  {
    if ((${#country}==2)) # checks if the argument is two characters long
    then
      i=6
    elif ((${#country}>2)) # checks if the argument is greater than two characters
    then
      i=5
    else # if the condition is not checked it is less than two characters
      echo "The country code is too short..."
      exit
    fi
    curl --request GET 'https://www.vpngate.net/api/iphone/' > 'cache/request.txt' # sends a get request to get the list of available servers
    if ! grep -q "*vpn_servers" 'cache/request.txt' # verifies the authenticity of the data
    then
      notify-send -i dialog-error 'Unable to get data from VPN servers...'
      exit
    fi
    grep -v '^#\|^\*\|,-,' 'cache/request.txt' > $vpnup # remove unnecessary lines
    rm 'cache/request.txt'
    while read line # reads the file line by line with a loop
    do
      server_score=$(echo $line | cut -d"," -f3) # server score
      server_country_long=$(echo $line | cut -d"," -f6) # server country with more than two characters
      server_country_short=$(echo $line | cut -d"," -f7) # server country with two characters
      if [[ "$country" == "$server_country_short" ]] || [[ "$country" == "$server_country_long" ]];
      then
      #  echo "== Best server =="
      #  echo "HostName: $server_name"
      #  echo "IP: $server_ip"
      #  echo "Score: $server_score"
      #  echo "Ping: $server_ping"
      #  echo "Speed: $server_speed MBps"
      #  echo "Country: $server_country_long"
        array_score+=("${server_score[@]}")
      fi
    done < $vpnup
    IFS=$'\n'
    max_score=$(echo "${array_score[*]}" | sort -nr | head -n1)
    while read line
    do
      server_name=$(echo $line | cut -d"," -f1) # server name (hostname)
      server_ip=$(echo $line | cut -d"," -f2) # server ip
      speed=$(echo $line | cut -d"," -f5) # server speed calculation
      server_speed=$(echo "scale=2; $speed/1000000" | bc -l) # server speed in MBps
      server_ping=$(echo $line | cut -d"," -f4) # server ping
      server_score=$(echo $line | cut -d"," -f3) # server score
      server_country_long=$(echo $line | cut -d"," -f6) # server country with two characters
      server_config=$(echo $line | cut -d"," -f15) # base64 configuration
      if [[ "$max_score" == "$server_score" ]]; # selects the server with the best score
      then
        echo -e "\n== Best server =="
        echo "HostName: $server_name"
        echo "IP: $server_ip"
        echo "Score: $server_score"
        echo "Ping: $server_ping"
        echo "Speed: $server_speed MBps"
        echo -e "Country: $server_country_long\n"
        # decode base64 data
        # write config file in /etc/openvpn/update-resolv.conf
        echo $server_config | base64 -di > "$path_openvpn/update-resolv.conf"
      fi
    done < $vpnup
    echo -e "\nLaunching VPN..."
    sudo openvpn --config "$path_openvpn/update-resolv.conf"
    curl 'ifconfig.me'
    echo -e "\nVPN terminated"
  } || {
    notify-send -i dialog-error 'The KhunVPN client encountered an error while connecting, please try again...'
    exit
  }
}

# The first functions performed
servers
