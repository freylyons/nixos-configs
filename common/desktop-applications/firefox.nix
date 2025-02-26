{ pkgs, lib, config, ... } :
{
  options = {
    firefox.enable = lib.mkEnableOption "enables the firefox configuration on the system";
  };

  config = lib.mkIf config.firefox.enable {
    environment.systemPackages = [ pkgs.firefox ];

    #
    # --- write the profile configuration for firefox here
    #


  };

}
