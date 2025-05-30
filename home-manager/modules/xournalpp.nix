{ pkgs, lib, config, ... } :
let
  package = "xournalpp";
in
{
  options = {
    ${package}.enable = lib.mkEnableOption "enables the ${package} configuration on the system";
  };

  config = lib.mkIf config.${package}.enable {
    home.packages = [ pkgs.${package} ];
    home.file.".config/xournalpp/settings.xml".source = ./xournalpp/settings.xml;
  };
}


