{ config, pkgs, ... }:

{
  imports = [
    ./localisation.nix
    ./services/desktop-environment.nix
    ./CLI-tools/CLI-pkglist.nix
    ./desktop-applications/desktop-pkglist.nix

  ];

  # enable flakes for reproducable declarative building
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
