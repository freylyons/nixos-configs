{config, pkgs, ... }:

{
  imports = [
    ../home-default.nix
  ];

  home.username = "Frey";
  home.homeDirectory = "/home/frey";

  home.stateVersion = "23.11";

  #
  # --- enable/disable programs that differ from default specification here ---
  #


}
