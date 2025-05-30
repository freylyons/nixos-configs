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
    ./docker.nix
  ];

  options = {
    ${module}.enable = lib.mkEnableOption "Enable the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    plasma.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault false;
    bluetooth.enable = lib.mkDefault false;
    wacom.enable = lib.mkDefault false;
    postgres.enable = lib.mkDefault false;
    docker.enable = lib.mkDefault false;
  };
}
