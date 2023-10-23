#!/bin/bash


for host in $(cat lista-com-svm-exposto); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host "df -t nfs | grep -i svm | egrep -vi 'ora|dba|erp|sap'"

        fi

done
