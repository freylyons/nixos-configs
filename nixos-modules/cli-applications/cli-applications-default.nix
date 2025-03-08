{ lib, config, pkgs, ... }:
let
  module = "cli-applications-default";
in
{
  imports = [
    ./neovim.nix
    ./btop.nix
    ./sysstat.nix
    ./inxi.nix
    ./lxc.nix
    ./git.nix
    ./rsync.nix
    ./sshfs.nix
    ./usbutils.nix
    ./android-tools.nix
    ./ranger.nix
    ./tree.nix
  ];

  options = {
    ${module}.enable = lib.mkEnableOption "Enable the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    # enable
    git.enable = lib.mkDefault true; # version control
    btop.enable = lib.mkDefault true; # system performance monitoring
    tree.enable = lib.mkDefault true; # CLI file system structure viewer
    ranger.enable = lib.mkDefault true; # CLI file system navigation
    sysstat.enable = lib.mkDefault true; # in-depth system performance monitoring tools
    inxi.enable = lib.mkDefault true; # system/hardware information tool
    rsync.enable = lib.mkDefault true; # remote syncing
    sshfs.enable = lib.mkDefault true; # sftp protocol
    lxc.enable = lib.mkDefault true; # containerisation


    # disable
    neovim.enable = lib.mkDefault false; # managed via home-manager
    android-tools.enable = lib.mkDefault false; # tools for working with android operating systems
    usbutils.enable = lib.mkDefault false; # tools for querying usb devices

  };
}
