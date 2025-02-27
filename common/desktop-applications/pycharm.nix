{ pkgs, lib, config, ... } :
{
  options = {
    pycharm.enable = lib.mkEnableOption "enables the pycharm configuration on the system";
  };

  config = lib.mkIf config.pycharm.enable {
    environment.systemPackages = [ pkgs.jetbrains.pycharm-community ];
  };
}
