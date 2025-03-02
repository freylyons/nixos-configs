{ lib, config, pkgs, inputs, ... }:

{

  options = {
    hyprland.enable = lib.mkEnableOption "Enables the hyprland environment for the system";
  };

  config = lib.mkIf config.hyprland.enable {
    # display manager
    services.displayManager.sddm.enable = true;

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

    hardware = {
      graphics.enable = true;

      nvidia.modesetting.enable = true;
    };

    
    environment.systemPackages = with pkgs; [
      
      # --- system bar ---
      waybar
      # eww # the fully customisable one!

      # --- wallpaper daemon ---
      swww

      # --- terminal emulator ---
      kitty

      # --- app launcher ---
      rofi-wayland

      # --- workspace overviewer ---
      hyprlandPlugins.hyprspace

      # --- workspace monitor splitter --- (allows a workspace to span multiple monitors?)
      hyprlandPlugins.hyprsplit
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
