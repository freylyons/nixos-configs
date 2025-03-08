{ pkgs, lib, config, ... } :
let
  package = "pycharm";
  packageName = "jetbrains.pycharm-community";
in
{
  options = {
    ${package}.enable = lib.mkEnableOption "enables the ${package} configuration on the system";
  };

  config = lib.mkIf config.${package}.enable {
      environment.systemPackages = [ pkgs.${packageName} ];
    };
}


