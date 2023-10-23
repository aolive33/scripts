#!/bin/bash


for host in $(cat lista-atencao); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo "SERVIDOR: " $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host '[ -x /usr/sbin/smbd ] && w | grep -i SMB'

        fi



done
