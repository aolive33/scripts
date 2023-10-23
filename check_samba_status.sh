#!/bin/bash


for host in $(cat lista-samba-fisicos); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo "SERVIDOR: " $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'service smb status | grep "Active:"'

        fi



done
