{ pkgs, lib, config, ... } :
let
  package = "pycharm";
  packageName = "jetbrains.pycharm-professional";
in
{
  options = {
    ${package}.enable = lib.mkEnableOption "enables the ${package} configuration on the system";
  };

  config = lib.mkIf config.${package}.enable {
      environment.systemPackages = [ pkgs.${packageName} ];
    };
}


