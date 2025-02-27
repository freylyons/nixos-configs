{ pkgs, lib, config, ... } :
{
  options = {
    telegram.enable = lib.mkEnableOption "enables the telegram configuration on the system";
  };

  config = lib.mkIf config.telegram.enable {
    environment.systemPackages = [ pkgs.telegram-desktop ];
  };
}
