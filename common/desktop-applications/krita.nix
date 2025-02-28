{ pkgs, lib, config, ... } :
let
  package = "krita";
in
{
  options = {
    ${package} = {
      enable = lib.mkEnableOption "enables the ${package} configuration on the system";
      packageUser = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "If set, installs ${package} for the specified user instead of system-wide.";
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.${package}.enable && config.${package}.packageUser == null) {
      environment.systemPackages = [ pkgs.${package} ];
    })
    (lib.mkIf (config.${package}.enable && config.${package}.packageUser != null) {
      users.users.${config.${package}.packageUser}.packages = [ pkgs.${package} ];
    })
  ];
}

