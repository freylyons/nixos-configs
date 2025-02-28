{config, pkgs, lib, inputs, ... }:

{
  imports = [
    ../modules/home-default.nix
  ];

  # BE WARNED, USER MUST ALREADY BE DEFINED ON THE SYSTEM WITH IDENTICAL SETTINGS FOR THESE TWO OPTIONS!!!
  home.username = "frey"; # (!) make sure this is identical to the variable name that defines the user on the system
  home.homeDirectory = "/home/frey"; # (!) make sure this is identical to home directory defined for the user on the system

  home.stateVersion = "23.11";

  #
  # --- enable/disable programs that differ from default specification here ---
  #
}
