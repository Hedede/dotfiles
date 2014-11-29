#!/usr/bin/bash

for i in {1..6} {9..14} {17..222} {226..228} ;
do
	COLORS+=("$i")
done

while :
do
	echo -e "\e[48;5;${COLORS[$((RANDOM%221))]}m"
	sleep 0.033
done
