{
  description = "An example NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
        nixosConfigurations = {
            shuttle = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/shuttle/configuration.nix
                    home-manager.nixosModules.home-manager 
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.eethern = ./users/eethern/home.nix;

                    }
                ];
            };
        };
    };
}
