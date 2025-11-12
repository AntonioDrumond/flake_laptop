{
  config,
  pkgs,
  inputs,
  ...
}:

{
    imports = [
        ./hardware-configuration.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Sao_Paulo";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "pt_BR.UTF-8";
        LC_IDENTIFICATION = "pt_BR.UTF-8";
        LC_MEASUREMENT = "pt_BR.UTF-8";
        LC_MONETARY = "pt_BR.UTF-8";
        LC_NAME = "pt_BR.UTF-8";
        LC_NUMERIC = "pt_BR.UTF-8";
        LC_PAPER = "pt_BR.UTF-8";
        LC_TELEPHONE = "pt_BR.UTF-8";
        LC_TIME = "pt_BR.UTF-8";
    };

    # Configure X11
    services = {
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        xserver = {
            enable = true;
            # wacom.enable = true;
            xkb.layout = "br";
            xkb.variant = "nodeadkeys";
        };
        openssh = {
            enable = true;
            ports = [ 22 ];
            settings = {
                PasswordAuthentication = true;
                AllowUsers = [ "puddo" "antonio" ];
                UseDns = true;
                X11Forwarding = false;
                PermitRootLogin = "no";
            }; 
        };
        thermald.enable = true;
        printing.enable = true;
        flatpak = {
            enable = true;
            packages = [
                { appId = "net.waterfox.waterfox"; origin = "flathub"; }
            ];
        };
        blueman.enable = true;
        logind.powerKey = "suspend";
    };

    # Configure console keymap
    console.keyMap = "br-abnt2";

    hardware = {
        # Screen brightness control
        brillo.enable = true;

        # Drawing tablet drivers
        opentabletdriver.enable = true;
        
        # Bluetooth
        bluetooth = {
            enable = true;
            powerOnBoot = true;
            input.General.ClassicBondedOnly = false;
        };
    };


    # Enable sound
    security.rtkit.enable = true;
    services = {
        # pulseaudio.enable = true;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
            wireplumber.enable = true;
        };
    };

    # Audio fix
    hardware.enableAllFirmware = true;
    boot.extraModprobeConfig = ''
        options snd-intel-dspcfg dsp_driver=1
    '';

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

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
        groups.puddo = {
        };
    };

    programs = {
        # Firefox
        firefox.enable = true;

        # Begone satan master of all deceit
        nano.enable = false;

        # Hyprland
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
        hyprlock.enable = true;

        # Steam
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            extraCompatPackages = with pkgs; [
                proton-ge-bin
            ];
        };

        # Starship
        starship = {
            enable = true;
            settings = {
            add_newline = true;
            # "$schema" = "https://starship.rs/config-schema.json";
            character = {
                success_symbol = "[❯](bold green)";
                error_symbol = "[❯](bold bright green)";
            };
            nix_shell = {
                symbol = " ";
                heuristic = false;
            };
            username = {
                show_always = true;
                style_user = "green bold";
                style_root = "bright-red bold";
            };
            os.disabled = false;
            # palette = "catppuccin_${"mocha"}";
            };
        };

        # Enable appimage support
        appimage = {
            enable = true;
            binfmt = true;
        };

    };

    # Allow unfree packages
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "ventoy-1.1.05" ];
        # Necessary for android studio
        # android_sdk.accept_license = true;
    };

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        font-awesome
    ];

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
    };

    # Fix wayland usage
    environment.sessionVariables = {
        # NIXOS_OZONE_WL = "1";
        GDK_BACKEND = "wayland,x11";
        GDK_SCALE = 1;
        QT_SCALE_FACTOR = "1.0";
        QT_AUTO_SCALE_FACTOR = "1.0";
        QT_QPA_PLATFORM = "wayland;xcb";
        # QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    # Global system packages
    environment.systemPackages = with pkgs; [

        #CLI -> Essential
        vim
        git
        wezterm
        fzf
        zip
        unzip
        rar
        unrar
        kitty
        killall
        # neovim
        # inputs.nixvim.packages.${pkgs.system}.default # NixVim

        #CLI -> Pretty and shiny :D
        bat
        tree
        eza
        neofetch
        fastfetch
        yazi

        # Hyprland
        waybar
        hyprcursor
        hyprshot
        hyprpaper
        hypridle
        rofi-wayland

        #Image stuff
        pix
        rawtherapee
        krita
        vlc

        #Non raw text
        obsidian
        foliate

        #Torrenting and stuff
        # qbittorrent
        # mullvad

        #Nonfree entertainment
        stremio
        discord
        spotify

        #Virtual Machine
        quickemu
        spice

        #Hardware/Libs
        ventoy-full
        gparted
        fan2go
        btop
        pavucontrol
        brightnessctl
        playerctl
        blueman

        #Other
        kdePackages.kcalc
        cava
        floorp
        mars-mips
        rars
        jflap
        # android-studio-full
    ];

    environment.localBinInPath = true;

    # DO NOT CHANGE
    system.stateVersion = "24.11"; # Did you read the comment?

}
