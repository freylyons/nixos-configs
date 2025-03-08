{ pkgs, lib, config, ... } :
let
  package = "kitty";
in
{
  options = {
    ${package}.enable = lib.mkEnableOption "enables the ${package} configuration on the system";
  };

  config = lib.mkIf config.${package}.enable {
    home.packages = [ pkgs.${package} ];
  };
}


