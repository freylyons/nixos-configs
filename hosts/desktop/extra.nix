{ config, lib, pkgs, ... }:

{
  # in here put the changes to configuration settings for monitors, etc.
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "nvidia"
             "nvidia-x11"
             "nvidia-settings"
             "discord"
             "steam"
             "steam-unwrapped"
           ];

  # possibly add gaming user configuration here
}
