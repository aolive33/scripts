#!/bin/bash


for host in $(cat lista-egm); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'zdump -v /etc/localtime | grep -i 2022'

        fi



done
