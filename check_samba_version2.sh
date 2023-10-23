#!/bin/bash


for host in $(cat lista-samba-fisicos); do

        if ! ping -c 2 $host >/dev/null; then

                echo  $host >> sem-conexao.txt

        else
                echo  $host
                ssh -o BatchMode=yes -o ConnectTimeout=3 $host '[ -x /usr/sbin/smbd ] && grep -Fi "min protocol = smb2" /etc/samba/smb.conf'

        fi



done
