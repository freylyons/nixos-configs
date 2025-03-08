{ lib, config, ... }:
{
  options = {
    users.gaming.enable = lib.mkEnableOption "enables the gaming user configuration on the system";
  };

  config = lib.mkIf config.users.gaming.enable {
    users.users.gaming = {
      isNormalUser = true;
      home = "/home/gaming/";
      extraGroups = [ "wheel" ]; # User permission groups (wheel enables sudo)
    };
  };
}

