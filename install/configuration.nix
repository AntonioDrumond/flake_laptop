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

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.wacom.enable = true;

  # # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "br";
    xkb.variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
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

  users.users.antonio = {
    isNormalUser = true;
    description = "Antonio Drumond";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs = {
    # Firefox
    firefox.enable = true;

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

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Global system packages
  environment.systemPackages = with pkgs; [

    #CLI -> Essential
    vim
    git
    wezterm
    fzf
    zip

    #CLI -> Pretty and shiny :D
    bat
    tree
    eza # -> better to do in programs. but couldnt yet
    neofetch

    #Hardware/Libs
    ventoy-full
    gparted
    fan2go

    #Other
    kdePackages.kcalc
    cava
  ];

  environment.localBinInPath = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # DO NOT CHANGE
  system.stateVersion = "24.05"; # Did you read the comment?

}
