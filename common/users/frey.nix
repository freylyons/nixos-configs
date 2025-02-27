{ lib, config, pkgs, ... }:
{
  options = {
    users.frey.enable = lib.mkEnableOption "enables the frey user configuration on the system";
  };

  config = lib.mkIf config.users.frey.enable {
    users.users.frey = {
      isNormalUser = true;
      home = "/home/frey";
      shell = pkgs.bash;
      extraGroups = [ "wheel" "networkmanager" ]; # User permission groups (wheel enables sudo)
    };
  };
}
