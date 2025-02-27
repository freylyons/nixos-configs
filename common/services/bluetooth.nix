{lib, config, pkgs, ... }:

{
    options = {
        bluetooth.enable = lib.mkEnableOption "enables the audacity configuration on the system";
    };

    config = lib.mkIf config.bluetooth.enable {

        hardware.bluetooth.enable = true;
        hardware.bluetooth.powerOnBoot = true;
        services.blueman.enable = true;

#         environment.systemPackages = [ pkgs.kdePackages.bluedevil ];
    };
}
