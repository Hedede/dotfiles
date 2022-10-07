#!/usr/bin/sh

echo stop connman
systemctl stop connman
echo reload driver
rmmod iwlmvm
rmmod iwlwifi
modprobe iwlwifi
echo start connman
systemctl start connman
