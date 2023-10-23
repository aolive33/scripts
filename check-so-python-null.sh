#!/bin/bash


for host in $(cat lista-rv); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> server-error-so.txt

        else
		system=$(ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/*-release | grep PRETTY_NAME | cut -d "=" -f 2')
		python=$(ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'rpm -qa | grep -i "^python[1-9.-]\{4\}" | tr "\n" ";"')
		echo "$host;$system;$python"                
		

        fi



done
