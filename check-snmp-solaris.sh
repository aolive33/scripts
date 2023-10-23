#!/bin/bash


for host in $(cat lista-solaris); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/snmp/conf/snmpd.conf | grep "0.0.0.0"'

        fi



done
