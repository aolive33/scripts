#!/bin/bash


for host in $(cat lista-mytechcare); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ping -c 1 $host | grep ttl= | awk '{print $7}'

        fi



done
