#!/bin/bash
#set -x

ip=1

echo "Informe os 3 primeiros octetos da rede ex: 192.168.2"
read rede

while [ $ip -lt 254 ]; do

        if  ping -c 2 $rede.$ip >/dev/null; then

                echo $rede.$ip
		host $rede.$ip

	fi

	let ip=ip+1;
done
