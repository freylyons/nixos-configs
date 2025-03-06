{config, lib, inputs, ...}:

{
    imports = [
        ./git.nix
        ./firefox.nix
        ./neovim.nix
        ./hyprland.nix
        ./dolphin.nix
    ];

    #
    # --- set default activation of modules here ---
    #

    git.enable = lib.mkDefault true;
    firefox.enable = lib.mkDefault true;
    neovim.enable = lib.mkDefault false; # disabled in favour of nvf
    hyprland.enable = lib.mkDefault true;
    dolphin.enable = lib.mkDefault true;
}
