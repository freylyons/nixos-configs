{ config, pkgs, lib, inputs, ... }:
let
  modules_path = ../../nixos-modules;
in
{
  imports = [
    # "${modules_path}"/cli-applications/default.nix
    # "${modules_path}"/desktop-applications/default.nix
    # "${modules_path}"/services/default.nix
    # "${modules_path}"/users/default.nix
    ../../nixos-modules/cli-applications/default.nix
    ../../nixos-modules/desktop-applications/default.nix
    ../../nixos-modules/services/default.nix
    ../../nixos-modules/users/default.nix
  ];  


  # CLI applications
  git.enable = true; # version control
  btop.enable = true; # system performance monitoring
  tree.enable = true; # CLI file system structure viewer
  ranger.enable = true; # CLI file system navigation
  sysstat.enable = true; # in-depth system performance monitoring tools
  inxi.enable = true; # system/hardware information tool
  rsync.enable = true; # remote syncing
  sshfs.enable = true; # sftp protocol
  lxc.enable = false; # containerisation
  android-tools.enable = false; # tools for working with android operating systems
  usbutils.enable = true; # tools for querying usb devices

  # Desktop applications
  nextcloud-client.enable = true;
  kitty.enable = true;
  baobab.enable = true;
  xournalpp.enable = true;
  obs-studio.enable = true;
  libreoffice.enable = true;
  pycharm.enable = false;
  vlc.enable = true;
  firefox.enable = true;
  audacity.enable = true;
  steam.enable = true;
  discord.enable = true;
  texliveFull.enable = true;
  krita.enable = true;
  signal-desktop.enable = true;
  telegram-desktop.enable = true;

  # Services
  plasma.enable = true;
  hyprland.enable = false;
  bluetooth.enable = true;
  wacom.enable = true;
  postgres.enable = false;
  docker.enable = true;

  # Users
  users.frey.enable =  true;
  users.gaming.enable = false;

  # other packages
  environment.systemPackages = with pkgs; [
    hello
  ];
}
