{ config, pkgs, ... }:

{
  # enable flakes for reproducable declarative building
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    #font = "fira-code";
    keyMap = "uk";
    #useXkbConfig = true; # use xkb.options in tty.
  };

  # system utility package management
  environment.systemPackages = with pkgs; [
    btop # system performance monitoring
    sysstat # in-depth system performance monitoring tools
    lxc # containerisation
    git # version control
    rsync # remote syncing
    sshfs # sftp protocol
    usbutils # tools for querying usb devices
    android-tools # tools for working with android operating systems
    ranger # CLI file system navigation
    tree # CLI file system structure viewer
#     powerdevil # power management
  ];

  ## desktop environment
  # display manager
  services.displayManager.sddm.enable = true;

  # display server (wayland)
  services.displayManager.sddm.wayland.enable = true;

  # desktop environment
  services.desktopManager.plasma6.enable = true;

}
