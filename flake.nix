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
    nixosConfigurations =
    let
      configPath.user.frey = ./home-manager/users/frey.nix; # path to user "frey"'s configuration for simplicity
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
        ];
      };
    };

    homeConfigurations = {
      frey = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ configPath.user.frey ];
      };
    };
  };
}
