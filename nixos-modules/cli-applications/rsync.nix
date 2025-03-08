{ config, lib, pkgs, ... }:
let
  package = "rsync";
in
{
  options = {

    ${package}.enable = lib.mkEnableOption "Enable the ${package} CLI configuration on the system";

  };

  config = lib.mkIf config.${package}.enable {
    environment.systemPackages = [ pkgs.${package} ];

  };

}
