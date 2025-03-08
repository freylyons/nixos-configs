{config, lib, ...}:

{
    imports = [
        ./audacity.nix
        ./baobab.nix
        ./discord.nix
        ./firefox.nix
        ./git.nix
        ./jetbrains.pycharm-community.nix
        ./kitty.nix
        ./krita.nix
        ./libreoffice.nix
        ./neovim.nix
        ./obs-studio.nix
        #./plasma.nix
        ./signal-desktop.nix
        ./steam.nix
        ./telegram-desktop.nix
        ./texliveFull.nix
        ./vlc.nix
        ./xournalpp.nix
    ];

    #
    # --- set default activation of modules here ---
    #

    # enable
    audacity.enable = lib.mkDefault true;
    baobab.enable = lib.mkDefault true;
    discord.enable = lib.mkDefault true;
    firefox.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    krita.enable = lib.mkDefault true;
    libreoffice.enable = lib.mkDefault true;
    obs-studio.enable = lib.mkDefault true;
    # plasma.enable = lib.mkDefault true;
    signal-desktop.enable = lib.mkDefault true;
    steam.enable = lib.mkDefault true;
    telegram-desktop.enable = lib.mkDefault true;
    texliveFull.enable = lib.mkDefault true;
    vlc.enable = lib.mkDefault true;
    xournalpp.enable = lib.mkDefault true;

    # disable
    neovim.enable = lib.mkDefault false;
    pycharm.enable = lib.mkDefault false; # error: attribute '"jetbrains.pycharm-community"' missing
                                          #  at /nix/store/29lxyz4v5n8q3ql0326pd3a884rgpbbd-source/home-manager/modules/jetbrains.pycharm-community.nix:12:23:
                                          #      11|   config = lib.mkIf config.${package}.enable {
                                          #      12|     home.packages = [ pkgs.${packageName} ];

}
