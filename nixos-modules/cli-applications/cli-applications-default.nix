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

    git.enable = lib.mkDefault false; # version control
    btop.enable = lib.mkDefault false; # system performance monitoring
    tree.enable = lib.mkDefault false; # CLI file system structure viewer
    ranger.enable = lib.mkDefault false; # CLI file system navigation
    sysstat.enable = lib.mkDefault false; # in-depth system performance monitoring tools
    inxi.enable = lib.mkDefault false; # system/hardware information tool
    rsync.enable = lib.mkDefault false; # remote syncing
    sshfs.enable = lib.mkDefault false; # sftp protocol
    lxc.enable = lib.mkDefault false; # containerisation
    android-tools.enable = lib.mkDefault false; # tools for working with android operating systems
    usbutils.enable = lib.mkDefault false; # tools for querying usb devices

  };
}
