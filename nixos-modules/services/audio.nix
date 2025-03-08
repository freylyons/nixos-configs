{ config, lib, ... }:
let
  module = "audio";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} home-manager configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
    
    security.rtkit.enable = false; # set to true according to NixOS enjoyer (I think)
    services.pipewire = { 
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
