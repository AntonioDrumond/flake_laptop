{ lib, self, ... }:
{
    imports = [
        ./nixpkgs.nix
        ./programs.nix
        ./flatpak_appimage.nix
    ];
}

