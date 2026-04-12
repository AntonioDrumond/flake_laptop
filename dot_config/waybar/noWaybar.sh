#!/bin/sh

# kill $(pidof waybar)
kill $(pidof waybar)
killall waybar
killall autohide.sh
killall autohide
killall autohide_wd
