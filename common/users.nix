{ config, pkgs, ... }:

{
  users.users.frey = {
    isNormalUser = true;
    home = "/home/frey/";
    extraGroups = [ "wheel" "networkmanager" ]; # User permission groups (wheel enables sudo)
#     packages = with pkgs; [
#       baobab
#       firefox
#       discord
#       signal-desktop
#       telegram-desktop
#       jetbrains.pycharm-community
#       xournalpp
#       texliveFull
#       libreoffice-qt6
#       krita
#       obs-studio
#       audacity
#       vlc
#     ];
  };

#   users.users.gaming = {
#     isNormalUser = true;
#     home = "/home/gaming/";
#     extraGroups = [ "wheel" ]; # User permission groups (wheel enables sudo)
#     packages = with pkgs; [
#       baobab
#       firefox
#       steam
#       discord
#     ];
#   };

}
