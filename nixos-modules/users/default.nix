{ lib, config, ... }:
{
  imports = [
    ./frey.nix
    ./gaming.nix
  ];

  # default user account activations
  users.frey.enable = lib.mkDefault true;
  users.gaming.enable = lib.mkDefault false;

}
