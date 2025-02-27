{config, lib, ...}:

{
    imports = [
        ./git.nix
    ];

    #
    # --- set default activation of modules here ---
    #

    git.enable = lib.mkDefault true;

}
