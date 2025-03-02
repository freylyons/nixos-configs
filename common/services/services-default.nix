{config, lib, ... }:
{
  imports = [
    ./desktop-environment.nix
    ./bluetooth.nix
    ./postgres.nix
    ./hyprland.nix
  ];

  desktop-environment.enable = lib.mkDefault false;
  hyprland.enable = true; 
  bluetooth.enable = lib.mkDefault true;
  postgres.enable = lib.mkDefault false;

}
