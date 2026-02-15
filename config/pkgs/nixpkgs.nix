{ pkgs, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "ventoy-1.1.07" ];
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
        gemini-cli

        # Hyprland
        waybar
        hyprcursor
        hyprshot
        hyprpaper
        hypridle
        rofi

        #Image stuff
        pix
        rawtherapee
        krita
        vlc

        #Non raw text
        obsidian
        mcomix

        #Torrenting and stuff
        # qbittorrent
        # mullvad

        #Nonfree entertainment
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
        distrobox

        #Uni
        wireshark
        tshark
        mars-mips
        rars
        jflap

        #Other
        kdePackages.kcalc
        cava
        prismlauncher
        google-chrome
    ];


    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
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
