{ pkgs, lib, config, ... } :
{
  options = {
    signal.enable = lib.mkEnableOption "enables the signal configuration on the system";
  };

  config = lib.mkIf config.signal.enable {
    environment.systemPackages = [ pkgs.signal-desktop ];
  };
}
