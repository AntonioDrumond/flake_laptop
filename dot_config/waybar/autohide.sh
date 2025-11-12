#!/bin/sh

pos_threshold=60
vel_threshold=175
status=0
open=0

while true; do

	window=$(hyprctl activeworkspace | grep windows: | cut -d' ' -f2)
	new_ypos=$(hyprctl cursorpos | cut -d' ' -f2)
	vel=$((ypos - new_ypos))
	# echo "$vel - $vel_threshold"
	# echo "$open"

	if [ "$vel" -ge "$vel_threshold" ]; then
		open=1
	fi

	if [ $window == 0 ]; then # Open when no windows are open

		if [ $status != 1 ]; then
			pkill -SIGUSR1 waybar
			status=1
		fi
	elif [ "$open" -eq 1 ] && [ "$ypos" -le "$pos_threshold" ]; then # Open on hover
		if [ $status != 1 ]; then
			pkill -SIGUSR1 waybar
			status=1
		fi
	elif [ "$ypos" -gt "$pos_threshold" ]; then		   	# Close on not hover
		if [ $status != 2 ]; then
			open=0
			pkill -SIGUSR1 waybar
			status=2
		fi
	fi
	ypos=$new_ypos
	sleep 0.1
done
