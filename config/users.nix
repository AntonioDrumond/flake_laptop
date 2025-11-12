{ pkgs, lib, self, ... }:
{
    users = {
        users.antonio = {
            isNormalUser = true;
            description = "Antonio Drumond";
            extraGroups = [
                "networkmanager"
                "wheel"
                "libvirtd"
            ];
            packages = with pkgs; [
                kdePackages.kate
            ];
        };
    };
    users.puddo = {
        isNormalUser = true;
        description = "Davi Puddo";
        extraGroups = [
            "libvirtd"
            "wheel"
        ];
    };
}
