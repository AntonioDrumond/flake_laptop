{
  description = "NixOS System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

		nixvim.url = "github:AntonioDrumond/nixvim";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
      modules = [
				# Import configuration.nix file
        ./configuration.nix
      ];
    };
  };
}
