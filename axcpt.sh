#!/bin/bash
Ma='A'
Mb='X'
clear
echo ''
echo -n "${Ma}"
sleep 0.1
echo -en "\b${Mb}"
sleep 0.1
echo -en "\b"
ANS="l"
COUNT=0
CORRECT=0
while read -N1 -p ">" line
do
	echo ''
	if [ "${Ma}" == "$1" ] && [ "${Mb}" == "$2" ]
	then
		ANS="h"
	fi
	if [ "$line" == "q" ]
	then
		break
	fi
	COUNT=$(( "${COUNT}" + 1 ))
	if [ "$line" == "$ANS" ]
	then
		Ma=$(shuf -n 1 axcpt-M1.txt )
		Mb=$( shuf -n 1 axcpt-M2.txt )
		ANS="l"
		CORRECT=$(( "${CORRECT}" + 1 ))
		echo -n "${Ma}"
		sleep 0.1
		echo -en "\b${Mb}"
		sleep 0.1
		clear
		echo -en "\b"
		echo ''
	else
		clear
		echo "・_・"
	fi
done
echo "${CORRECT} in ${COUNT} correct"
