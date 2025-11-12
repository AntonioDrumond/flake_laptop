#!/bin/sh

# .config
cd /home/antonio/repos/flake_laptop/dot_config
cp -r ./hypr/ /home/antonio/.config/
cp -r ./kitty/ /home/antonio/.config/
cp -r ./waybar/ /home/antonio/.config/

# ~
cd /home/antonio/repos/flake_laptop/dots
cp ./.* /home/antonio
