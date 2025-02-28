{ lib, config, ... }:

{
#   imports = [
#     inputs.nvf.nixosModules.default
#   ];

  programs.nvf = {
    enable = true;
    settings = {
      # neovim settings
      vim = {
        theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
            enableLSP = true;
            enableTreesitter = true;

            #  --- add your LSPs here ---
            nix.enable = true;
        };
      };
    };
  };

}
