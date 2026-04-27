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
        EDITOR = "vim";
    };

    services = {
        thermald.enable = true;
        printing.enable = true;
        logind.settings.Login.HandlePowerKey = "suspend";

        power-profiles-daemon.enable = false;
        tlp = {
            enable = true;
            settings = {
                # CPU_SCALING_GOVERNOR_ON_AC = "performance";
                # CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                # CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
                # CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

                TLP_DEFAULT_MODE = "BAT";
                # TLP_PERSISTENT_DEFAULT = 1;

                # CPU_MIN_PERF_ON_AC = 0;
                # CPU_MAX_PERF_ON_AC = 100;
                # CPU_MIN_PERF_ON_BAT = 0;
                # CPU_MAX_PERF_ON_BAT = 20;
            };
        };
    };

    hardware = {
        # Drawing tablet driver
        opentabletdriver.enable = true;
        # Brightness control
        brillo.enable = true;
    };

    virtualisation = {
        podman = {
            enable = true;
            # dockerCompat = true;
        };
        docker.enable = true;
    };

    # Bluetooth
    services.blueman.enable = true;
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        input.General.ClassicBondedOnly = false;
    };

    # DO NOT CHANGE
    system.stateVersion = "24.11"; # Did you read the comment?
}
    
