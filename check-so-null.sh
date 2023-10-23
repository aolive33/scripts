#!/bin/bash


for host in $(cat lista-devops-so-null); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> server-error-so.txt

        else
		system=$(ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/*-release | tail -n 1')
		echo "$host;$system"                
		

        fi



done
