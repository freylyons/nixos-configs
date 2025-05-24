{ config, lib, pkgs, ... }:
let
  module = "docker";
in
{
    options = {
        ${module}.enable = lib.mkEnableOption "Enables the ${module} environment for the system";
    };

    config = lib.mkIf config.${module}.enable {
      virtualisation.docker.enable = true;
  };
}
