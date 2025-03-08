{ pkgs, lib, config, ... } :
let
  package = "signal-desktop";
in
{
  options = {
    ${package}.enable = lib.mkEnableOption "enables the ${package} configuration on the system";
  };

  config = lib.mkIf config.${package}.enable {
      environment.systemPackages = [ pkgs.${package} ];
    };
}

