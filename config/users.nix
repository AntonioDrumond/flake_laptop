{ pkgs, ... }:
{
    users = {
        users.antonio = {
            isNormalUser = true;
            description = "Antonio Drumond";
            extraGroups = [
                "networkmanager"
                "wheel"
                "docker"
                "libvirtd"
            ];
            packages = with pkgs; [
                kdePackages.kate
            ];
            shell = pkgs.fish;
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
        hostName = "antonio-laptop"; 
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
        tailscale.enable = true;
    };
}
