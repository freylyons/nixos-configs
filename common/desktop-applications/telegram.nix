{ pkgs, lib, config, ... } :
{
  options = {
    discord.enable = lib.mkEnableOption "enables the discord configuration on the system";
  };

  config = lib.mkIf config.discord.enable {
    environment.systemPackages = [ pkgs.discord ];
  };
}
