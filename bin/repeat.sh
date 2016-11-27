#!/usr/bin/bash
# I wrote this shell script to reduce amount of typing, when I use things
# such as ytdl
# Arguments to this script are passed to eval
REP_CMD="$@"
THIS=$0

while :
do
	printf "%s$ %s " "$THIS" "$REP_CMD"
	read ARGS
	eval $REP_CMD $ARGS
done
