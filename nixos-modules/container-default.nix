{ config, lib, pkgs, ... }:

{
  imports = [
    ./services/services-default.nix
    ./cli-applications/cli-applications-default.nix
    ./desktop-applications/desktop-applications-default.nix
    ./users/users-default.nix
    ./localisation.nix
    ./NVF.nix # EXPERIMENTAL!
  ];

  # enable flakes for reproducable declarative building
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #
  # --- Enable Defaults Modules ---
  #

  # desktop applications
  desktop-applications-default.enable = false;

  # cli applications
  cli-applications-default.enable = true;

  # services
  services-default.enable = true;
  plasma.enable = lib.mkDefault false;

  # users
  users-default.enable = true;
  gaming.enable = lib.mkDefault false;

}
