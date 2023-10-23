#!/bin/bash


for host in $(cat listaegm); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/snmp/snmpd.conf | grep "/0"'

        fi



done
