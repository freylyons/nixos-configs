{ pkgs, lib, config, ... } :
{
  options = {
    discord.enable = lib.mkEnableOption "enables the discord configuration on the system";
    discord.packageUser = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "If set, installs Discord for the specified user instead of system-wide.";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.discord.enable && config.discord.packageUser == null) {
      environment.systemPackages = [ pkgs.discord ];
    })
    (lib.mkIf (config.discord.enable && config.discord.packageUser != null) {
      users.users.${config.discord.packageUser}.packages = [ pkgs.discord ];
    })
  ];
}
