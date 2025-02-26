{
  description = "My technology infrastructure configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure consistency
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... } @inputs:
  let
    default_system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = default_system;
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./hosts/laptop/configuration.nix  # Laptop-specific config
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = default_system;
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };
  };
}
