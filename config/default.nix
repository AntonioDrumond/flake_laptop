{ lib, self, ... }:
{
    imports = [
        ./de_wm
        ./pkgs

        ./hardware-configuration.nix
        ./system.nix
        ./users.nix
        ./localization.nix
        ./audio.nix
        ./sh.nix
    ];
}
