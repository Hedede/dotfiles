#!/usr/bin/sh

if [ "$#" -ne 1 ]
then
	echo "Usage: preserve-date.sh file"
	echo ""
	echo "I wrote this script to preserve timestamps of edited files."
 	exit 1
fi

# Create temporary dummy file
tmpfile=$(mktemp)	|| exit 1
# Touch that file with date of $1
touch -r $1 $tmpfile 	|| exit 1

# Wait for user input
read -p "Press [Enter] when you are done with $1 ..."

# Restore date and remove dummy file
touch -r $tmpfile $1 && rm $tmpfile
