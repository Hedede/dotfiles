#!/bin/sh
# Small utility to check if program is installed
command -v $1 >/dev/null 2>&1 || exit 1
