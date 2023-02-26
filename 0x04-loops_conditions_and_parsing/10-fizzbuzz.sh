#!/usr/bin/env bash
#the beautiful fizzbuzz

x=1
y=3
z=5

while [ $x -le 100 ]
do
	if [ $((x%5)) == 0 ] && [ $((x%3)) == 0 ]
	then
		echo "FizzBuzz"
	elif [ $((x%3)) == 0 ]
	then
		echo "Fizz"
	elif [ $((x%5)) == 0 ]
	then
		echo "Buzz"
	else
		echo $x
	fi
	x=$(( $x + 1 ))
done
			
