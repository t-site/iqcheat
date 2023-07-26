#!/bin/bash
PP="< < < < < < < < < < <"
ANS="<"
A="1"
COUNT=0
CORRECT=0
clear
echo ''
while read -N1 -p "$PP" line
do
	if [ "${line}" == "q" ]
	then
		break
	fi
	COUNT=$(( "${COUNT}" + 1 ))
	if [ "$A" -eq "1" ]
	then
		ANS="<"
	elif [ "$A" -eq "2" ]
	then
		ANS=">"
	elif [ "$A" -eq "3" ]
	then
		ANS="<"
	elif [ "$A" -eq "4" ]
	then
		ANS=">"
	fi
	

	if [ "$line" == "$ANS" ]
	then
		CORRECT=$(( "${CORRECT}" + 1 ))
		A=$( seq 1 4 | shuf -n 1 )
		PP=$( head -"$A" flanker.txt | tail -1 )
		clear
		echo ''
	else
		clear
		echo "・_・"
	fi
done
echo ''
echo "${CORRECT} in ${COUNT} correct"
