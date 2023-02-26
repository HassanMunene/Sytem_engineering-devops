#!/usr/bin/env bash
#check if file exists or does not exist

File=school
if [ -e "$File" ]
then
	echo "school file exists"
	if [ ! -s "$File" ]
	then
		echo "school file is empty"
	else
		echo "school file is not empty"
	fi

	if [ -f "$File" ]
	then
		echo "school is a regular file"
	fi
else
	echo "school file does not exist"
fi
