#!/usr/bin/bash

file=$(mktemp wtest.XXXXXXXX)
timeout --foreground 10s pv -ra /dev/zero > ${file}
rm ${file}
