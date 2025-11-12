{ pkgs, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "ventoy-1.1.05" ];
    };

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

    nix = {
        settings.experimental-features = [
            "nix-command"
            "flakes"
        ];
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
    };
}
