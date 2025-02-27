{ config, lib, ... }:

{
    options = {
        desktop-environment.enable = lib.mkEnableOption "Enables the Desktop environment for the system";
    };

    config = lib.mkIf config.desktop-environment.enable {
      # display manager
      services.displayManager.sddm.enable = true;

      # display server (wayland)
      services.displayManager.sddm.wayland.enable = true;

      # desktop environment
      services.desktopManager.plasma6.enable = true;
    };
}
