#!/bin/bash


for host in $(cat lista2); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/snmp/snmpd.conf | grep -v "com2sec monitoramento" | grep -v "^#" | grep -v "{blanc}"'

        fi



done
