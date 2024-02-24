{
  description = "0fie's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors = {
      url = "github:misterio77/nix-colors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
  {
    nixosConfigurations = {
      "NixOS" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./system/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs nixvim; };
              users.me = import ./home/home.nix;
            };
          }
	];
      };
    };
  };
}
