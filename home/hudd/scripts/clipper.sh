#!/usr/bin/zsh
# Script, I wrote to continue clipper's legacy
# of naming screenshots clpXXXX.png/.jpg
# It is pretty dirty, but gets the job done

# Default vars
clip_dir="$HOME"
clip_id=0
clip_ext="png"
id_file="$clip_dir/.lastid"
config_file="$HOME/.local/clipper.conf"
window_border=false
method="fullscreen"
shooter="scrot"
shooter_args=()

function inc_id {
	if [ -e $id_file ] ;
	then
		clip_id=$(<$clip_dir/.lastid)
		(( clip_id=$clip_id+1 ))
	else
		clip_id=1;
	fi
}

function write_id {
	echo $clip_id >| $clip_dir/.lastid
}

# Quick and dirty config parser
function parse_config {
	echo "$config_file"
	if [ -e $config_file ] ;
	then
		echo "tru"
		# Set IFS to =, to parse options as 'var=VALUE'
		OLDIFS=$IFS
		IFS="="
		while read -r name value
		do
			echo "$name $value"
			case "$name" in 
				'clip-dir') clip_dir="$value"
					;;
			esac	
		done < $config_file
		IFS=$OLDIFS
	fi
}

# Select screenshooter and format command line
function select_shooter {
	case $shooter in
	scrot)
		#clipper_command="scrot"
		
		case $method in
		active)
			shooter_args+=('-u')

			if [[ $window_border == true ]] ;
			then
				shooter_args+=('-b')
			fi

			;;
		*)
			## default, fullscreen
			;;
		esac
		;;
	magick)
		#clipper_command="import"
		shooter=import

		case $method in
		active)
			find_window
			shooter_args+=('-window')
			shooter_args+=("$activeWinId")


			if [[ $window_border == true ]] ;
			then
				shooter_args+=('-border')
			       	shooter_args+=('-frame')
			fi

			;;
		*)
			## default, fullscreen
			shooter_args+=('-window')
			shooter_args+=('root')
			;;
		esac
		;;
	*)
		echo "Unrecognized program"
		return 1
		;;
	esac
}

# (not working) Find active window
function __find_window {
	activeWinLine=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)")
	activeWinId=${activeWinLine:40}
}

# Find active window
function find_window {
	activeWinId=$(xdotool getwindowfocus)
}

parse_config 	|| exit 1

# Parse arguments
while [[ $# > 0 ]]
do
	arg="$1"
	shift

	case $arg in
	-f|--format)
		clip_ext="$1"
		shift
		;;
	-b|--border)
		window_border=true
		;;
	--no-border)
		window_border=false
		;;
	-w|--active-window)
		method="active"
		;;
	-p|--program|--shooter)
		shooter="$1"
		;;
	*)
		##
		;;
	esac			
done

select_shooter 	|| exit 1
inc_id		|| exit 1

shooter_args+=("$clip_dir/clp$clip_id.$clip_ext")

# Execute command
"$shooter" ${shooter_args[@]} && write_id
