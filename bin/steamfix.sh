#!/usr/bin/bash
RUNTIME=$HOME/.local/share/Steam/ubuntu12_32/steam-runtime

runtime_paths=()
runtime_paths+=('i386/usr/lib/i386-linux-gnu')
runtime_paths+=('amd64/usr/lib/x86_64-linux-gnu')

# iterate through each path
for RUNTIME_LIB in ${runtime_paths[@]}; do
	# use string expansion to simplify command
	mv -f $RUNTIME/$RUNTIME_LIB/libstdc++.so.6{,.disable}
done
