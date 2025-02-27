{ pkgs, lib, config, ... } :
{
  options = {
    firefox.enable = lib.mkEnableOption "enables the firefox configuration on the system";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox.enable = true;

    #
    # --- write the profile configuration for firefox here
    #

#     programs.firefox.profiles.frey = {};
    programs.firefox.profiles.frey = {
      id = 0;
      name = "Frey";
      isDefault = true;
      search.force = true;
      search.default = "DuckDuckGo";

      # containers
      containersForce = true; # Ensure Containers specified in this configuration are implemented

      containers.normal = {
        color = "blue";
        icon = "circle";
        id = 1;
        name = "Normal";
      };

      containers.nsfw = {
        color = "purple";
        icon = "circle";
        id = 2;
        name = "NSFW";
      };


#        # extensions
#        extensions = [
#
#        ];


      # additional configuration
      extraConfig = "";
      # [1] https://kb.mozillazine.org/About:config_entries#Browser.
      # [2] https://kb.mozillazine.org/User.js_file#Adding_user.js_entries


    };

  };

}
