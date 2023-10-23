#!/bin/bash


for host in $(cat listaegm); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host "df -t nfs | sed 's/\s\+/ /g' | cut -d' ' -f1 | grep 10."

        fi

done
