#!/bin/sh

# .config
cd /home/antonio/repos/flake_laptop/dot_config
cp -r ./hypr/ /home/antonio/.config/
cp -r ./kitty/ /home/antonio/.config/
cp -r ./waybar/ /home/antonio/.config/
cp -r ./fish/ /home/antonio/.config/

# ~
cd /home/antonio/repos/flake_laptop/dots
cp .bashrc /home/antonio/
cp .gitconfig /home/antonio/
cp .vimrc /home/antonio/
cp .wezterm.lua /home/antonio/

# .local/bin/
cd /home/antonio/repos/flake_laptop/path
cp ./* /home/antonio/.local/bin/
