{
  description = "An example NixOS configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs?ref=nixos-24.11"; };
  };

  outputs = inputs @ { self, nixpkgs }: {
    nixosConfigurations = {
      shuttle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/shuttle/configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
