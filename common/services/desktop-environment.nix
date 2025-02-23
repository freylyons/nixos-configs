{ config, ... }:

{
    # display manager
    services.displayManager.sddm.enable = true;

    # display server (wayland)
    services.displayManager.sddm.wayland.enable = true;

    # desktop environment
    services.desktopManager.plasma6.enable = true;
}
