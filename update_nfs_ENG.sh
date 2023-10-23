#!/bin/bash


for host in $(cat lista-iterativas-egm); do

        if ! ping -c 2 $host >/dev/null; then

                echo "SERVIDOR: " $host " NÃO RESPONDENDO" >> resultado.txt

        else
                echo "SERVIDOR: " $host
		ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'umount /nfs/cae/Esys/OfflineMonitors'
		ssh -o BatchMode=yes -o ConnectTimeout=3 $host '/emb/sbin/InstallPkg local embraer/AMBIENTE'
		ssh -o BatchMode=yes -o ConnectTimeout=3 $host 'mount -a'

        fi

done
