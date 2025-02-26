{ config, lib, pkgs, ... }:

{
  imports = [
    ./localisation.nix
    ./services/desktop-environment.nix
    ./CLI-tools/CLI-pkglist.nix
    ./desktop-applications/desktop-pkglist.nix

  ];

  # enable flakes for reproducable declarative building
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # enable unfree programs
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "discord"
           ];

}
