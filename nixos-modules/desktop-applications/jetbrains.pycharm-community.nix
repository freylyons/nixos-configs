{ pkgs, lib, config, ... } :
let
  optionName = "pycharm";
  package = "jetbrains.pycharm-community";
in
{
  options = {
    ${optionName} = {
      enable = lib.mkEnableOption "enables the ${package} configuration on the system";
      packageUser = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "If set, installs ${package} for the specified user instead of system-wide.";
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.${optionName}.enable && config.${optionName}.packageUser == null) {
      environment.systemPackages = [ pkgs.${package} ];
    })
    (lib.mkIf (config.${optionName}.enable && config.${optionName}.packageUser != null) {
      users.users.${config.${optionName}.packageUser}.packages = [ pkgs.${package} ];
    })
  ];
}
