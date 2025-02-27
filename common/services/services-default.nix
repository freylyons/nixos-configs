{config, lib, ... }:
{
  imports = [
    ./desktop-environment.nix
    ./bluetooth.nix
    ./postgres.nix
  ];

  desktop-environment.enable = lib.mkDefault true;
  bluetooth.enable = lib.mkDefault true;
  postgres.enable = lib.mkDefault false;

}
