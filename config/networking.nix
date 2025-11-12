{ lib, self, ... }:
{
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
