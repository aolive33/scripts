#!/bin/bash


for host in $(cat lista-full); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host "df -t nfs | grep -i svm"

        fi

done
