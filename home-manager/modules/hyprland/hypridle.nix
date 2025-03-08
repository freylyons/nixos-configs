{ config, lib, ... }:
let
  module = "hypridle";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";        # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session";     # lock before suspend
          after_sleep_cmd = "hyprctl dispatch dpms on";   # put monitors into power saving (off) mode
        };

        # Lock the screen
        listener = [
          {
              timeout = 300;
              on-timeout = "loginctl lock-session";
          }

          # Turn off screen
          {
              timeout = 360;
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on";
          }

          # Suspend the system
          {
              timeout = 600;
              on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
