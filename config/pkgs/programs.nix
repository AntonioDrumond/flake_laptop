{ pkgs, ... }:
{
    programs = {
        # Firefox
        firefox.enable = true;

        # Begone Satan master of all deceit
        nano.enable = false;

        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            extraCompatPackages = with pkgs; [
                proton-ge-bin
            ];
        };
    };
}
