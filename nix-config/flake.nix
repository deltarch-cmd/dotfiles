{
  description = "NixOS Config Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
  in {
    # you have to use your hostname as the name of the configuration. "nixos" as default
    nixosConfigurations = {
      # Laptop
      lifebone = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/common.nix
          ./hosts/laptop/configuration.nix
        ];
      };

      # Desktop
      # desktop = nixpkgs.lib.nixosSystem {
      #   inherit system;
      #   modules = [
      #     ./hosts/desktop/configuration.nix
      #   ];
      # };
    };
  };
}
