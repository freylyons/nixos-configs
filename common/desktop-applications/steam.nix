{ pkgs, lib, config, ... } :
{
  options = {
    steam.enable = lib.mkEnableOption "enables the steam configuration on the system";
  };

  config = lib.mkIf config.steam.enable {
    environment.systemPackages = [ pkgs.steam ];
  };
}
