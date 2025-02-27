{ pkgs, lib, config, ... } :
{
  options = {
    libreoffice.enable = lib.mkEnableOption "enables the libreoffice configuration on the system";
  };

  config = lib.mkIf config.libreoffice.enable {
    environment.systemPackages = [ pkgs.libreoffice ];
  };
}
