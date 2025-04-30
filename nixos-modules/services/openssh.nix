{ config, lib, pkgs, ... }:
let
  package = "openssh";
in
{
  options = {

    ${package}.enable = lib.mkEnableOption "Enable the ${package} CLI configuration on the system";

  };

  config = lib.mkIf config.${package}.enable {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "no";
      };
    };
  };

}
