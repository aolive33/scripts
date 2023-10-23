#!/bin/bash
#set -x

ip=1

echo "Informe os 3 primeiros octetos da rede ex: 192.168.2"
read rede

while [ $ip -lt 254 ]; do

        if  ping -c 2 $rede.$ip >/dev/null; then

                echo $rede.$ip
		system=$(ssh -o BatchMode=yes -o ConnectTimeout=3 $rede.$ip 'cat /etc/*-release | grep PRETTY_NAME | cut -d "=" -f 2')
                python=$(ssh -o BatchMode=yes -o ConnectTimeout=3 $rede.$ip 'rpm -qa | grep -i "^python[1-9.-]\{4\}" | tr "\n" ";"')
		host=$(ssh -o BatchMode=yes -o ConnectTimeout=3 $rede.$ip 'hostname')
                echo "$host;$system;$python"
	
	fi

	let ip=ip+1;
done
