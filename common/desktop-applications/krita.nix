{ pkgs, lib, config, ... } :
{
  options = {
    krita.enable = lib.mkEnableOption "enables the krita configuration on the system";
  };

  config = lib.mkIf config.discord.enable {
    environment.systemPackages = [ pkgs.krita ];
  };
}
