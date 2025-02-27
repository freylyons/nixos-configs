{ pkgs, lib, config, ... } :
{
  options = {
    vlc.enable = lib.mkEnableOption "enables the vlc configuration on the system";
  };

  config = lib.mkIf config.vlc.enable {
    environment.systemPackages = [ pkgs.vlc ];
  };
}
