#!/bin/sh

threshold=25
status=0

while true; do

	ypos=$(hyprctl cursorpos | cut -d' ' -f2)
	window=$(hyprctl activeworkspace | grep windows: | cut -d' ' -f2)

	if [ $window == 0 ]; then # Open when no windows are open

		if [ $status != 1 ]; then
			pkill -SIGUSR2 waybar
			status=1
		fi
	elif [ "$ypos" -le "$threshold" ]; then # Open on hover
		if [ $status != 1 ]; then
			pkill -SIGUSR2 waybar
			status=1
		fi
	else 							   	# Close on not hover
		if [ $status != 2 ]; then
			pkill -SIGUSR1 waybar
			status=2
		fi
	fi

	sleep 0.1
done
