{ pkgs, lib, config, ... } :
{
  options = {
    baobab.enable = lib.mkEnableOption "enables the baobab configuration on the system";
  };

  config = lib.mkIf config.baobab.enable {
    environment.systemPackages = [ pkgs.baobab ];
  };
}
