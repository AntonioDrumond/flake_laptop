#!/bin/sh

# .config
cd /home/antonio/repos/flake_laptop/dot_config
cp -r /home/antonio/.config/hypr .
cp -r /home/antonio/.config/kitty .
cp -r /home/antonio/.config/waybar .

# ~
cd /home/antonio/repos/flake_laptop/dots
cp /home/antonio/.bashrc .
cp /home/antonio/.gitconfig .
cp /home/antonio/.vimrc .
cp /home/antonio/.wezterm.lua .


