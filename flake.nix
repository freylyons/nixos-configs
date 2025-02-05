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

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... } @inputs: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./common/default.nix  # Shared system-wide settings
          ./common/users.nix  # Shared user settings
          ./common/networking.nix  # Shared networking settings
          ./common/home-manager.nix  # Shared Home Manager setup
          home-manager.nixosModules.home-manager
          ./hosts/laptop/configuration.nix  # Laptop-specific config
          ./hosts/laptop/hardware-configuration.nix  # Laptop hardware config
          ./hosts/laptop/extra.nix  # Laptop-specific overrides
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./common/default.nix
          ./common/users.nix
          ./common/networking.nix
          ./common/home-manager.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
          }
          ./hosts/desktop/configuration.nix
          ./hosts/desktop/hardware-configuration.nix
          ./hosts/desktop/extra.nix
        ];
      };
    };
  };
}
