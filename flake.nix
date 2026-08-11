{
    description = "NixOS System Flake";

    inputs = {
        stable.url = "github:NixOS/nixpkgs/nixos-26.05";
        #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        #nixpkgs.url = "github:nixos/nixpkgs?rev=0b9e82138431f31772b103d3957994fb254dd5e8";
        nixpkgs.url = "github:nixos/nixpkgs?rev=4b1cd35e951dd2760cf83fe5bf5129d26464ae31";
        #nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

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
