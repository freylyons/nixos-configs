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
    ../../nixos-modules/NVF.nix
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
  usbutils.enable = false; # tools for querying usb devices

  # Desktop applications
  nextcloud-client.enable = false;
  kitty.enable = false;
  baobab.enable = false;
  xournalpp.enable = false;
  obs-studio.enable = false;
  libreoffice.enable = false;
  pycharm.enable = false;
  vlc.enable = false;
  firefox.enable = false;
  audacity.enable = false;
  steam.enable = false;
  discord.enable = false;
  texliveFull.enable = false;
  krita.enable = false;
  signal-desktop.enable = false;
  telegram-desktop.enable = false;

  # Services
  plasma.enable = false;
  hyprland.enable = false;
  bluetooth.enable = false;
  wacom.enable = false;
  postgres.enable = false;
  docker.enable = true;

  # Users
  users.frey.enable =  true;
  users.gaming.enable = false;

  # other packages
  environment.systemPackages = with pkgs; [
    screenfetch
    cowsay
    nushell
  ];
}
