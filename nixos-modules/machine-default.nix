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
  desktop-applications-default.enable = lib.mkDefault true;

  # cli applications
  cli-applications-default.enable = lib.mkDefault true;

  # services
  services-default.enable = lib.mkDefault true;

  # users
  users-default.enable = lib.mkDefault true;

}
