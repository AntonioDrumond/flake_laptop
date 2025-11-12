{ pkgs, ... }:
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
        users.puddo = {
            isNormalUser = true;
            description = "Davi Puddo";
            extraGroups = [
                "libvirtd"
                "wheel"
            ];
        };
    };

    networking = {
        hostName = "nixos"; 
        networkmanager.enable = true;
    };

    services = {
        openssh = {
            enable = true;
            ports = [ 22 ];
            settings = {
                UseDns = true;
                PasswordAuthentication = true;
                AllowUsers = [ "puddo" "antonio" ];
                X11Forwarding = false;
                PermitRootLogin = "no";
            };
        };
    };
}
