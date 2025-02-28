{
  description = "My technology infrastructure configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure consistency with nixpkgs
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure consistency with nixpkgs
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, nvf, ... } @inputs:
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
    let
      home_manager_attrs = user_config: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.frey = import configPath.user.frey; # import user "frey"'s configuration
      };
    in
    {
      laptop = nixpkgs.lib.nixosSystem {
        system = default_system;
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./hosts/laptop/configuration.nix  # Laptop-specific config
          home-manager.nixosModules.home-manager home_manager_attrs # home manager module (allows home-manager to be built with system)
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = default_system;
        specialArgs = { inherit inputs; }; # Pass inputs to configs
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager home_manager_attrs # home manager module (allows home-manager to be built with system)
          nvf.nixosModules.default
        ];
      };
    };

    # standalone home-manager configuration
    homeConfigurations = {
      frey = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ configPath.user.frey ];
      };
    };
  };
}
