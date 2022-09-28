#!/bin/bash
clear
echo '***********************************************'
echo '**                                           **'
echo '**             Script Cisco ASA              **'
echo '**     Criar grupo com IPs como objetos      **'
echo '**                                           **'
echo '***********************************************'
echo 
echo Pressione uma tecla para continuar
read x
    clear
    objects=$(cat IPs.txt | wc -l)
    IPs=( ${IPs[@]} `cat IPs.txt` )
    FQDN=( ${FQDN[@]} `cat FQDN.txt` )
    echo "Insira o nome do grupo novo:"
    read group
    clear
    echo
        echo '#'
        echo conf t
        echo '#'
        for (( c=0; c<=$objects; c++ )) do
            echo object network ${FQDN[$c]}
            echo host ${IPs[$c]}
        done
        echo object-group network $group
        for (( c=0; c<=$objects; c++ )) do
            echo network-object object ${FQDN[$c]}
        done
        echo exit
        echo wr
        echo '#'
        echo '#'