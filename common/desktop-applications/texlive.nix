{ pkgs, lib, config, ... } :
{
  options = {
    texlive.enable = lib.mkEnableOption "enables the texlive configuration on the system";
  };

  config = lib.mkIf config.texlive.enable {
    environment.systemPackages = [ pkgs.texliveFull ];
  };
}
