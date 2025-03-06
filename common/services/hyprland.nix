{ lib, config, pkgs, inputs, ... }:

{

  options = {
    hyprland.enable = lib.mkEnableOption "Enables the hyprland environment for the system";
  };

  config = lib.mkIf config.hyprland.enable {
    # display manager
    services.displayManager.sddm.enable = true;
    # services.displayManager.sddm.theme = "sddm-astronaut";

    # display server (wayland)
    services.displayManager.sddm.wayland.enable = true;

    # desktop environment
    programs.hyprland = {
      enable = true;
      # nvidiaPatches = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    environment.sessionVariables = {
      
    };
    
    environment.systemPackages = with pkgs; [

      # # sddm login theme
      # sddm-astronaut
      
      # system bar
      waybar
      # eww # the fully customisable one!

      # wallpaper daemon
      swww

      # terminal emulator
      kitty

      # clipboard manager
      copyq

      # screenshot utility
      hyprshot

      # app launcher (trying a new one)
      wofi 
      rofi-wayland

      # workspace overviewer
      hyprlandPlugins.hyprspace

    ]; 

    # desktop portal (handles desktop applications interactions between each other)
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # sound
    security.rtkit.enable = true;
    services.pipewire = { # used for screen sharing amongst other things
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    /* # set up hyprspace
    programs.hyprland.plugins = [
      pkgs.hyprlandPlugins.hyprspace
    ]; */

  };
}
