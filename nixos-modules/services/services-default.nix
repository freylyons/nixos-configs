{ lib, config, ... }:
let
  module = "services-default";
in
{
  imports = [
    ./plasma.nix
    ./bluetooth.nix
    ./postgres.nix
    ./hyprland.nix
    ./wacom.nix
    ./openssh.nix
  ];

  options = {
    ${module}.enable = lib.mkEnableOption "Enable the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    plasma.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault true;
    bluetooth.enable = lib.mkDefault true;
    wacom.enable = lib.mkDefault true;
    postgres.enable = lib.mkDefault false;
    openssh.enable =lib.mkDefault true;
  };

}
