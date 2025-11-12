{
    description = "NixOS System Flake";

    inputs = {
        stable.url = "github:NixOS/nixpkgs/nixos-25.05";
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # nixvim.url = "github:AntonioDrumond/nixvim";
        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    outputs =
        { self, nixpkgs, nvf, nix-flatpak, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    # Import configuration
                    ./config
                    # NVF module and config file
                    nvf.nixosModules.default
                    ./nvf.nix
                    # Nix-flatpak module
                    nix-flatpak.nixosModules.nix-flatpak
                ];
            };
        };
}
