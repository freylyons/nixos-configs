{ pkgs, lib, config, ... } :
let
  package = "vlc";
in
{
  options = {
    ${package}.enable = lib.mkEnableOption "enables the ${package} configuration on the system";
  };

  config = lib.mkIf config.${package}.enable {
      environment.systemPackages = [ pkgs.${package} ];
    };
}

