#!/usr/bin/env bash
#use while loop to print the clock

x=0
j=1
while [ $x -le 12 ]
do
	echo "Hour: $x"
	while [ $j -le 59 ]
	do
		echo $j
		j=$(($j + 1))
	done
	x=$(($x + 1))
	j=1
done
