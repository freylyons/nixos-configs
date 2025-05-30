{ lib, config, pkgs, ... }:
{
  imports = [
    ./audacity.nix
    ./firefox.nix
    ./discord.nix
    ./baobab.nix
    ./libreoffice.nix
    ./jetbrains.pycharm-community.nix
    ./steam.nix
    ./texliveFull.nix
    ./xournalpp.nix
    ./krita.nix
    ./obs-studio.nix
    ./signal-desktop.nix
    ./telegram-desktop.nix
    ./vlc.nix
    ./kitty.nix
    ./nextcloud-client.nix
  ];

  nextcloud-client.enable = lib.mkDefault false;
  kitty.enable = lib.mkDefault false;
  baobab.enable = lib.mkDefault false;
  xournalpp.enable = lib.mkDefault false;
  obs-studio.enable = lib.mkDefault false;
  libreoffice.enable = lib.mkDefault false;
  pycharm.enable = lib.mkDefault false;
  vlc.enable = lib.mkDefault false;
  firefox.enable = lib.mkDefault false;
  audacity.enable = lib.mkDefault false;
  steam.enable = lib.mkDefault false;
  discord.enable = lib.mkDefault false;
  texliveFull.enable = lib.mkDefault false;
  krita.enable = lib.mkDefault false;
  signal-desktop.enable = lib.mkDefault false;
  telegram-desktop.enable = lib.mkDefault false;

}
