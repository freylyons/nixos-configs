{ config, lib, ... }:
let
  module = "mako";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
    services.mako.enable = true;
  };
}
