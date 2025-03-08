{ config, lib, ... }:
let
  module = "waybar";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} home-manager configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
      programs.waybar = { 
        enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            height = 15;
           /*  output = [
              "eDP-1"
              "HDMI-A-1"
            ]; */
            modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
            modules-center = [ "hyprland/window" "custom/hello-from-waybar" ];
            modules-right = [ "mpd" "network" "wireplumber" "bluetooth" "clock"];

            "hyprland/workspaces" = {
              all-outputs = false; # only show workspaces that exist on the monitor
            };
          };
        }; 
      }; 
    };
}
