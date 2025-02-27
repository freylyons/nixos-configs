{ pkgs, lib, config, ... } :
{
  options = {
    audacity.enable = lib.mkEnableOption "enables the audacity configuration on the system";
  };

  config = lib.mkIf config.audacity.enable {
    environment.systemPackages = [ pkgs.audacity ];
  };
}
