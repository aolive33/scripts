#!/bin/bash


for host in $(cat lista-aix); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'mv /etc/snmpdv3.conf /etc/snmpdv3.conf-old2'
		scp snmpdv3.conf $host:/etc/
		ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'refresh -s snmpd'

        fi



done
