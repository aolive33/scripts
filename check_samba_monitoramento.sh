#!/bin/bash


for host in $(cat lista-full-samba-run-egm); do

        if ! ping -c 2 $host >/dev/null; then

                echo  $host >> sem-conexao.txt

        else
		echo "#####################################################################"
		echo "#####################################################################"
		echo "#####################################################################"
		echo "#####################################################################"
		echo  $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'df -hT | grep nfs' | awk '{print $7}'

        fi



done
