{ lib, self, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ./system.nix
        ./users.nix
        ./networking.nix
        ./localization.nix
    ];
}
