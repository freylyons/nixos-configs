{ lib, config, ... }:
{
  imports = [
    ./plasma.nix
    ./bluetooth.nix
    ./postgres.nix
    ./hyprland.nix
    ./wacom.nix
    ./docker.nix
  ];

  plasma.enable = lib.mkDefault false;
  hyprland.enable = lib.mkDefault false;
  bluetooth.enable = lib.mkDefault false;
  wacom.enable = lib.mkDefault false;
  postgres.enable = lib.mkDefault false;
  docker.enable = lib.mkDefault false;

}
