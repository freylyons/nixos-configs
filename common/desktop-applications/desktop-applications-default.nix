{ pkgs, lib, ... }:
{
  imports = [
    ./audacity.nix
    ./firefox.nix
    ./discord.nix
    ./baobab.nix
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

  # enable by default
  firefox.enable = lib.mkDefault true;
  baobab.enable = lib.mkDefault true;
  xournalpp.enable = lib.mkDefault true;
  obs-studio.enable = lib.mkDefault true;
  libreoffice.enable = lib.mkDefault true;
  pycharm.enable = lib.mkDefault true;
  vlc.enable = lib.mkDefault true;

  # disable by default

  audacity.enable = lib.mkDefault false;
  steam.enable = lib.mkDefault false;
  texlive.enable = lib.mkDefault false;
  krita.enable = lib.mkDefault false;
  signal.enable = lib.mkDefault false;
  telegram.enable = lib.mkDefault false;

  # test user package definition with module
  discord.enable = lib.mkDefault true;
  discord.packageUser = "frey";

}
