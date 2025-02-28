{config, lib, ...}:

{
    imports = [
        ./git.nix
        ./firefox.nix
        ./neovim.nix
    ];

    #
    # --- set default activation of modules here ---
    #

    git.enable = lib.mkDefault true;
    firefox.enable = lib.mkDefault true;
    neovim.enable = lib.mkDefault false; # disabled in favour of nvf
}
