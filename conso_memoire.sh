#!/bin/bash

#Script qui permet de savoir la consommation de mémoire d'une machine linux

totale=`cat /proc/meminfo | awk '{print $2}' | sed -n '1p'`
libre=`cat /proc/meminfo | awk '{print $2}' | sed -n '2p'`
reel_usee=$(($totale- $libre))
pourcent=$(($reel_usee*100/$totale))

#echo "$pourcent"

if [ "$pourcent" -lt 70 ]
then
        echo "OK - La memoire consommee est de : $pourcent%"
else
        echo "WARNING - La memoire est insufisante : $pourcent%"
fi
