{ config, lib, ... }:
let
  module = "";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
  };
}
