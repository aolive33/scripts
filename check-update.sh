#!/bin/bash


for host in $(cat lista-patch-GTG-PRD-EGM); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host 
                #ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'yum updateinfo info security'
		#ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/*release'
		ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'df -h | grep /boot'
        fi



done
