#!/bin/bash


for host in $(cat lista-bootsecure-prd-ori); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'mokutil --sb-state'

        fi



done
