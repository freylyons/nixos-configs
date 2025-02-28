{config, lib, ...}:

{
    imports = [
        ./git.nix
        ./firefox.nix
    ];

    #
    # --- set default activation of modules here ---
    #

    git.enable = lib.mkDefault true;
    firefox.enable = lib.mkDefault true;
}
