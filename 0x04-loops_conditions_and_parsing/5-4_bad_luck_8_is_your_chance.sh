#!/usr/bin/env bash
#using the while loop, if, elif and else

x=0
while [ $x -lt 10 ]
do
	x=$(($x + 1))
	if [ $x -eq 4 ]
	then
		echo "bad luck"
	elif [ $x -eq 8 ]
	then
		echo "good luck"
	else
		echo "Best School"
	fi
done
