{ lib, pkgs, ... }:

{
  imports = [
    ./neovim.nix
  ];
# system utility package management
  environment.systemPackages = with pkgs; [
    btop # system performance monitoring
    sysstat # in-depth system performance monitoring tools
    inxi # system/hardware information tool
    lxc # containerisation
    git # version control
    rsync # remote syncing
    sshfs # sftp protocol
    usbutils # tools for querying usb devices
    android-tools # tools for working with android operating systems
    ranger # CLI file system navigation
    tree # CLI file system structure viewer
    kdePackages.powerdevil # power management
  ];

  neovim.enable = lib.mkDefault false; # managed via home-manager
}
