{ lib, config, pkgs, ... }:
{
  imports = [
    ../desktop-applications/desktop-applications-default.nix
  ];

  options = {
    users.frey.enable = lib.mkEnableOption "enables the frey user configuration on the system";
  };

  config = lib.mkIf config.users.frey.enable {
    users.users.frey = {
      isNormalUser = true;
      home = "/home/frey";
      shell = pkgs.bash;
      extraGroups = [ "wheel" "networkmanager" ]; # User permission groups (wheel enables sudo)

#       # enable programs
#       firefox.enable = true;
#       baobab.enable = true;
#       xournalpp.enable = true;
#       obs-studio.enable = true;
#       libreoffice.enable = true;
#       pycharm.enable = true;
#       vlc.enable = true;
#       audacity.enable = true;
#       discord.enable = true;
#       steam.enable = true;
#       texlive.enable = true;
#       krita.enable = true;
#       signal.enable = true;
#       telegram.enable = true;
#
#       # disable programs

    };

  };
}
