sudo rm -fr /nix/var/nix/gcroots/auto/*
sudo nix-env -p /nix/var/nix/profiles/system/ --delete-generations old
sudo nix-collect-garbage -d
sudo nix-store --optimize
