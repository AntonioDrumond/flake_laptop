{ lib, self, ... }:
{
    services = {
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        xserver = {
            enable = true;
            xkb.layout = "br";
            xkb.variant = "nodeadkeys";
        };
    };
}
    
