{ pkgs, lib, config, ... } :
{
  options = {
    obs-studio.enable = lib.mkEnableOption "enables the obs-studio configuration on the system";
  };

  config = lib.mkIf config.obs-studio.enable {
    environment.systemPackages = [ pkgs.obs-studio ];
  };
}
