#!/bin/bash

> resultado.txt

# Loop para percorrer os hosts
for host in $(cat lista-fibrasil-geral.txt); do
    if ! ping -n 2 $host >/dev/null; then
        echo "SERVIDOR: $host NÃO RESPONDENDO" >> resultado.txt
    else
        echo "#####################################################################################"
        echo ""
        echo $host
        # Copiar as funções para o servidor remoto
        scp -p funcoes.sh fibrasiladm@$host:/tmp/funcoes2.sh
        # Executar o script no servidor remoto
        ssh fibrasiladm@$host /tmp/funcoes2.sh
        # Remover o arquivo temporário no servidor remoto
        ssh fibrasiladm@$host "rm /tmp/funcoes2.sh"
    fi
done
