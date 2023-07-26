#!/bin/bash
TMP=$( mktemp )

NUM=$( shuf -n 1 number1-5.txt )
shuf number.txt > ${TMP}
ANS=$( tail -"$NUM" ${TMP} | head -1 )
COUNT=0
CORRECT=0
clear
while true
do
	for a in $( cat ${TMP} )
	do
		echo -ne "\b$a"
		#echo $a
		sleep 0.5
	done
	NUM=$(( "$NUM" - 1 ))
	echo ''
	if read -p "$NUM before? >" line
	then
		if [ "$line" == "q" ]
		then
			break
		else
			COUNT=$(( "${COUNT}" + 1 ))
		fi
	else 
		break
	fi

	if [ "$ANS" == "$line" ]
	then
		clear
		echo "OK"
		CORRECT=$(( "${CORRECT}" + 1 ))
		NUM=$( shuf -n 1 number1-5.txt )
		shuf number.txt > ${TMP}
		ANS=$( tail -"$NUM" ${TMP} | head -1 )
	else
		clear
		echo "・_・"
		NUM=$(( "$NUM" + 1 ))
	fi
done
rm ${TMP}
echo ''
echo "${CORRECT} in ${COUNT} correct"
