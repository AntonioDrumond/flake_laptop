sudo cp ../flake.nix /etc/nixos/
sudo cp ../configuration.nix /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#nixos
cp ../dots/.* ~

cp ../scripts/* /home/seemg/Desktop/
chmod +x /home/seemg/Desktop/*.sh

