#!/bin/bash
PP="← "
ANS="h"
A=1
COUNT=0
CORRECT=0
while true
do

	if [ "$A" -le 6 ]
	then
		ANS="h"
	elif [ "$A" -ge 7 ]
	then
		ANS="l"
	fi
	if [ "$A" -eq 13 ]
	then
		ANS=""
		PP="■"
		RTIME=$( seq 1 8 | shuf -n 1 )
		read -N1 -p "${PP}" -t "${RTIME}" line
		echo ''
	else
		read -N1 -p "${PP}" line
		echo ''
	fi
	if [ "${line}" == "q" ]
	then
		break
	fi
	COUNT=$(( "${COUNT}" + 1 ))
	

	if [ "$line" == "$ANS" ]
	then
		CORRECT=$(( "${CORRECT}" + 1 ))
		A=$( seq 1 13 | shuf -n 1 )
		PP=$( head -${A} stopsig.txt | tail -1 )
		echo 'ok next'
	else
		echo '・_・'
	fi
done
echo "${CORRECT} in ${COUNT} correct"
