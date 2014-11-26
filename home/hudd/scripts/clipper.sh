#!/usr/bin/zsh
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="/home/hudd/Clipps"
clipper_command=""
activeWinId=0
clipper_id=0

function inc_id {
	clipper_id=$(<$DIR/.lastid)
	(( clipper_id=$clipper_id+1 ))
	echo $clipper_id > $DIR/.lastid
}

function __find_window {
	activeWinLine=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)")
	activeWinId=${activeWinLine:40}
}


function find_window {
	activeWinId=$(xdotool getwindowfocus)
}

case "$1" in
    -p)  inc_id; find_window;
	clipper_command="import -window $activeWinId -border -frame $DIR/clp$clipper_id.png"
        ;;
    -c)  inc_id; find_window;
	clipper_command="import -window $activeWinId $DIR/clp$clipper_id.jpg"
        ;;
    -w)  inc_id; find_window;
	clipper_command="import -window $activeWinId -frame $DIR/clp$clipper_id.png"
        ;;
    -s)  inc_id;
	clipper_command="import -window root $DIR/clp$clipper_id.png"
        ;;esac

eval "$clipper_command"
