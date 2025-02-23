{ pkgs, lib, config, ... } :
{
  options = {
    firefox.enable = lib.mkEnableOption "enables the firefox configuration on the system";
  };

  config = lib.mkIf config.option1.enable {
    environment.systemPackages = [ pkgs.discord ];

    #
    # --- write the profile configuration for firefox here
    #


  };

}
