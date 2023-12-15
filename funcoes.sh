# funcoes.sh

check_memory() {
    local total_memory free_memory used_percent

    total_memory=$(free -m | awk '/^Mem:/{print $2}')
    free_memory=$(free -m | awk '/^Mem:/{print $4}')
    used_percent=$(( (total_memory - free_memory) * 100 / total_memory ))

    echo "Total Memory: $total_memory MB"
    echo "Free Memory: $free_memory MB"
    echo "Used Memory: $used_percent%"

    if [ $used_percent -gt 40 ]; then
        echo "OK: Sem desperdício de memória RAM"
    else
        echo "ALERT: Menos de 40% da memória RAM está sendo utilizada!"
    fi
}

check_disk() {
    local iostat_output unused_disks

    echo "Verificando discos e I/O..."

    # Executar iostat uma vez e armazenar os resultados
    iostat_output=$(iostat -d -k | awk '/^Device:/{flag=1;next}/^$/{flag=0}flag' | grep -v '^$')

    # Processar os resultados
    echo "Saída do iostat:"
    echo "$iostat_output"

    unused_disks=$(echo "$iostat_output" | awk '$6 < 1 && $7 < 1 && $4 < 1 {print $1}')

    if [ -n "$unused_disks" ]; then
        echo "ALERT: Possíveis discos sem uso (I/O (tps), kB_read/s e kB_wrtn/s com baixo uso): $unused_disks"
    else
        echo "Todos os discos estão em uso."
    fi
}
check_memory
check_disk
