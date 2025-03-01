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
            name = "catppuccin";
            style = "frappe";
        };

        # options
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        # enable file tree menu
        filetree.nvimTree.enable = true;

        # enable system clipboard

        useSystemClipboard = true;

        # enable comment block tool
        comments.comment-nvim.enable = true;

        # enable terminal panel
        terminal.toggleterm.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          #  --- add your LSPs here ---
          nix.enable = true;
          python.enable = true;
          sql.enable = true;
          markdown.enable = true;
        };
      };
    };
  };

}
