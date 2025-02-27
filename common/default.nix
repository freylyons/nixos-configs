{ config, lib, pkgs, ... }:

{
  imports = [
    ./services/services-default.nix
    ./cli-applications/cli-applications-default.nix
    ./desktop-applications/desktop-applications-default.nix
    ./users/users.nix
    ./localisation.nix
  ];

  # enable flakes for reproducable declarative building
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
