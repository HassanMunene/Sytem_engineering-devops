#!/usr/bin/env bash
#list the content of the current directory

for file in *
do
	if [[ "$file" == *-* ]]
	then
		echo" ${file#*-}"
	else
		echo "$file"
	fi
done
