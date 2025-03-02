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
            name = "rose-pine";
            style = "moon";
        };

        # options
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        lineNumberMode = "number";

        # enable file tree menu
        filetree.nvimTree.enable = true;
        filetree.nvimTree.setupOpts.sync_root_with_cwd = true;

        # enable system clipboard
        useSystemClipboard = false;

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
