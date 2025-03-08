{ config, lib, pkgs, inputs, ... }:
let
  module = "hyprland";
in
{
  imports = [
    ./${module}/settings.nix
    ./${module}/hyprpaper.nix
    ./${module}/waybar.nix
    ./${module}/mako.nix
    ./${module}/hypridle.nix
    ./${module}/hyprlock.nix
  ];
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} home-manager configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
    
    #
    # --- Hyprland configuration ---
    #
    
    wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
      hyprspace
      # hyprsplit
    ];

    # enable hyprland and configure to use system level package
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;         # }
      portalPackage = null;   # } allows home-manager to use the hyprland packages defined at the system level
    };

    # hint electron apps to use wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    #
    # --- Modules ---
    #

    # hyprland settings
    settings.enable = true;  

    # hyprpaper configuration 
    hyprpaper.enable = true;

    # waybar configuration
    waybar.enable = true;

    # notification daemon
    mako.enable = true;

    # authentication agent

    # idle management daemon
    hypridle.enable = true;

    # screen lock utility
    hyprlock.enable = true;

    # wireplumber? screen sharing?




  };
}
