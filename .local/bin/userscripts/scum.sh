#!/usr/bin/env sh

lines=$(lsar "$1"|wc -l)


if [ $lines -eq 2 ]
then
	unar -D "$1"
elif [ $lines -gt 2 ]
then
	unar -d "$1"
else
	echo "File type not recognized."
fi
