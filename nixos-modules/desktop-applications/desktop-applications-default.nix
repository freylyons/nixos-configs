{ lib, config, pkgs, ... }:
let
  module = "desktop-applications-default";
in
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
  options = {
    ${module}.enable = lib.mkEnableOption "Enable the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    # enable by default
    nextcloud-client.enable = lib.mkDefault true;

    # disable by default
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


    # test user package definition with module

    # user applications (move to home-manager configurations? probably scrap entirely because it requires extra setup for multi-user configuration)
#     discord.packageUser = "frey";
    # when this mode is scrapped, replace with home-manager modules which install the packages for a user through user packages

  };

}
