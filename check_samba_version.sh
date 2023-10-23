#!/bin/bash


for host in $(cat lista-egm-fisicos-18-11-22); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo "SERVIDOR: " $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host '[ -x /usr/sbin/smbd ] && /usr/sbin/smbd -V'

        fi



done
