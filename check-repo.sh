#!/bin/bash


for host in $(cat lista-patch-GTG-DEV-QAS-EGM); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
		echo ""
		echo ""
		echo ""
		echo ""
                echo $host 
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/*release | grep "VERSION="'
		ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'cat /etc/yum.repos.d/embraer.repo'

        fi



done
