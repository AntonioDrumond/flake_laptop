{ lib, self, ... }:
{
    imports = [
        ./de_wm
        ./pkgs

        ./hardware-configuration.nix
        ./system.nix
        ./systemd-services.nix
        ./users.nix
        ./localization.nix
        ./audio.nix
        ./sh.nix
    ];
}
