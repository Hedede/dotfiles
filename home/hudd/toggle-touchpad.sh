#!/bin/zsh

function get_prop {
	echo $(xinput list-props $1 | grep $2 | cut -f3)
}

device='SynPS/2 Synaptics TouchPad'
prop='Device Enabled'
val=$(get_prop $device $prop)

if [ $val -eq "1" ] ; then
	xinput set-prop $device $prop 0
else
	xinput set-prop $device $prop 1
fi
