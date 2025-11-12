{ lib, self, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ./system.nix
        ./users.nix
        ./localization.nix
    ];
}
