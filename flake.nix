{
  description = "NixOS System Flake";

  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # nixvim.url = "github:AntonioDrumond/nixvim";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          # Import configuration.nix file
          ./configuration.nix
        ];
      };
    };
}
