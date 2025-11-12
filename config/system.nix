{ ... }:
{
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    environment.sessionVariables = {
        # NIXOS_OZONE_WL = "1";
        GDK_BACKEND = "wayland,x11";
        GDK_SCALE = 1;
        QT_SCALE_FACTOR = "1.0";
        QT_QPA_PLATFORM = "wayland;xcb";
        # QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    # DO NOT CHANGE
    system.stateVersion = "24.11"; # Did you read the comment?
}
    
