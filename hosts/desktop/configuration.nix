{ config, pkgs, inputs, ... }:

{
  # Import shared system-wide settings
  imports = [
    ../../common/default.nix
    ../../common/users.nix
    ../../common/networking.nix
#     ../../common/home-manager.nix
    ./hardware-configuration.nix # Device-specific hardware settings
    ./extra.nix # Import additional tweaks for this system
  ];

  # Device-specific hostname
  networking.hostName = "Freys-PC";


  ## file systems
  # mount drives
  fileSystems."/mnt/SSD2" = {
    device = "/dev/disk/by-label/SSD2";
    fsType = "ext4";
  };
  # configure bind-mounts (replacement for previous symlink setup)
  fileSystems."/home/frey" = {
    device = "/mnt/SSD2/home";
    options = [ "bind" ];
  };


  # Use the systemd-boot bootloader
  boot.loader.systemd-boot.enable = true;


  ## enable nvidia drivers
  # whitelist nvidia drivers from unfree list

  # DONE IN EXTRA
#   nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
#              "nvidia"
#              "nvidia-x11"
#              "nvidia-settings"
#            ];
  # set nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];
  # configure driver settings
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}
