{ pkgs, lib, ... }:
{
  imports = [
    ./audacity.nix
    ./firefox.nix
    ./discord.nix
#     ./baobab.nix
    ./libreoffice.nix
    ./pycharm.nix
    ./steam.nix
    ./texlive.nix
    ./xournalpp.nix
    ./krita.nix
    ./obs-studio.nix
    ./signal.nix
    ./telegram.nix
    ./vlc.nix
  ];

  audacity.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
  discord.enable = lib.mkDefault true;
#   baobab.enable = lib.mkDefault true;
  libreoffice.enable = lib.mkDefault true;
  pycharm.enable = lib.mkDefault true;
  steam.enable = lib.mkDefault true;
  texlive.enable = lib.mkDefault true;
  xournalpp.enable = lib.mkDefault true;
  krita.enable = lib.mkDefault true;
  obs-studio.enable = lib.mkDefault true;
  signal.enable = lib.mkDefault true;
  telegram.enable = lib.mkDefault true;
  vlc.enable = lib.mkDefault true;
}
