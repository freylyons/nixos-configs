{ lib, ... }:

{
  imports = [
    ./frey.nix
    ./gaming.nix
  ];

  #
  # --- set default user account activations here ---
  #

  users.frey.enable = lib.mkDefault true;
  users.gaming.enable = lib.mkDefault true;

}
