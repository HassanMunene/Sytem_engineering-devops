#!/usr/bin/env bash
#makes use of case statements and while loop

x=1
while [ $x -le 20 ]
do
	case $x in
		4)
			echo "4"
			echo "bad luck from China"
			;;
		9)
			echo "9"
			echo "bad luck from Japan"
			;;
		17)
			echo "17"
			echo "bad luck from Italy"
			;;
		*)
			echo $x
	esac
	x=$(($x + 1))
done

