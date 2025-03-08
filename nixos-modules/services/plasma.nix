{ config, lib, ... }:
let
  module = "plasma";
in
{
    options = {
        ${module}.enable = lib.mkEnableOption "Enables the ${module} environment for the system";
    };

    config = lib.mkIf config.${module}.enable {
      # display manager
      services.displayManager.sddm.enable = true;

      # display server (wayland)
      services.displayManager.sddm.wayland.enable = true;

      # desktop environment
      services.desktopManager.plasma6.enable = true;
    };
}
