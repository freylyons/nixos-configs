{config, lib, pkgs, ... }:

{
    options = {
        git.enable = lib.mkEnableOption "Activate the Git home-manager configuration";
    };

    config = lib.mkIf config.git.enable {
        programs.git = {
            enable = true;
            userName = "Frey home-manager";
            userEmail = "freylyons@hotmail.co.uk";
        };
    };
}
