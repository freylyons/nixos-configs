{ lib, config, pkgs, ... }:
let
  module = "cli-applications-default";
in
{
  imports = [
    ./neovim.nix
  ];

  options = {
    ${module}.enable = lib.mkEnableOption "Enable the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    # modules
    neovim.enable = lib.mkDefault false; # managed via home-manager

    # other system utility packages
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
  };
}
