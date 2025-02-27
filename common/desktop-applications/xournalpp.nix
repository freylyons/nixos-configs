{ pkgs, lib, config, ... } :
{
  options = {
    xournalpp.enable = lib.mkEnableOption "enables the xournalpp configuration on the system";
  };

  config = lib.mkIf config.xournalpp.enable {
    environment.systemPackages = [ pkgs.xournalpp ];
  };
}
