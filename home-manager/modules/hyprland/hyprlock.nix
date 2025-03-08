{ config, lib, ... }:
let
  module = "hyprlock";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
    programs.hyprlock = {
      enable = true;
      settings = {

      };
    };
  };
}
