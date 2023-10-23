#!/bin/bash


for host in $(cat lista-fazer); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO"

        else
                echo "SERVIDOR: " $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'df -h -t nfs'

        fi



done
