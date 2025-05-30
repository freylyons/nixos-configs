{
  description = "My technology infrastructure configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure consistency with nixpkgs
    };
  };

  outputs = { self, nixpkgs, nvf, ... } @inputs:
  let
    # system
    default_system = "x86_64-linux";

    # nixos/home manager
    configPath.user.frey = ./home-manager/users/frey.nix; # path to user "frey"'s configuration for simplicity

    # standalone home-manager
    pkgs = import nixpkgs { inherit default_system; }; # make available the package set for standalone home-manager
  in
  {
    nixosConfigurations =
    {
      laptop = nixpkgs.lib.nixosSystem {
        system = default_system;
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./hosts/laptop/configuration.nix  # Laptop-specific config
          nvf.nixosModules.default
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = default_system;
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./hosts/desktop/configuration.nix
          nvf.nixosModules.default
        ];
      };
      pone-drone-hypervisor = nixpkgs.lib.nixosSystem {
        system = default_system;
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./hosts/pone-drone-hypervisor/configuration.nix
          nvf.nixosModules.default
        ];
      };
    };
  };
}
