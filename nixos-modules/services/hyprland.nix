{ lib, config, pkgs, inputs, ... }:

{
  imports = [
    ./audio.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "Enables the hyprland environment for the system";
  };

  config = lib.mkIf config.hyprland.enable {
    # display manager
    services.displayManager.sddm = {
      enable = true;
      # theme = "sddm-astronaut-theme";
      theme = "chili";
    };

    # display server (wayland)
    services.displayManager.sddm.wayland.enable = true;

    # desktop environment
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    # declare environment variables here
    environment.sessionVariables = {
      
    };
    
    # declare packages to be installed to build the desktop environment
    environment.systemPackages = with pkgs; [

      # sddm login theme
      # sddm-astronaut
      sddm-chili-theme
      
      # system bar
      waybar
      # eww # the fully customisable one!

      # wallpaper daemon
      swww

      # terminal emulator
      kitty

      # file explorer
      kdePackages.dolphin

      # clipboard manager
      copyq

      # screenshot utility
      hyprshot

      # app launcher (trying a new one)
      wofi 
    ]; 

    # desktop portal (handles desktop applications interactions between each other)
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    #
    # --- modules ---
    #

    # sound
    audio.enable = true;
  };
}
