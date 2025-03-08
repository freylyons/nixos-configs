{ config, lib, pkgs, ... }:

{
  imports = [
    ./services/services-default.nix
    ./cli-applications/cli-applications-default.nix
    ./desktop-applications/desktop-applications-default.nix
    ./users/users.nix
    ./localisation.nix
    ./NVF.nix # EXPERIMENTAL!
  ];

  # enable flakes for reproducable declarative building
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  desktop-applications-default.enable = true;
  krita.enable = true;

}
