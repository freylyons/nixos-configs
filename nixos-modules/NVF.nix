{ lib, config, ... }:

{
#   imports = [
#     inputs.nvf.nixosModules.default
#   ];


  # packages I'm interested in:

  # - variable inspection/debugging - 
  # puremourning/vimspector variable inspection and debugging (seems pretty fleshed out)
  # Willem-J-an/visidata.nvim pandas dataframe viewer

  # - data viewing/editing - 
  # VidocqH/data-viewer.nvim lightweight csv viewer
  # hat0uma/csvview.nvim csv viewer and editor with customisable views (preferred, seems pretty fleshed out)
  # kndndrj/nvim-dbee database viwer (seems pretty fleshed out)

  # - image display -
  # edluffy/hologram.nvim image displayer
  # some kind of matplotlib viewer?
  
  # - python repl window - 
  # Vigemus/iron.nvim 

  # - juptyer emulation -
  # luk400/vim-jukit 

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

        # enable dev icons
        visuals.nvim-web-devicons.enable = true;

        # enable file tree menu
        filetree.nvimTree.enable = true;
        filetree.nvimTree.setupOpts.sync_root_with_cwd = true;

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

          # languages
          nix.enable = true;
          python.enable = true;
          sql.enable = true;
          julia.enable = true;
          haskell.enable = true;

          # markup 
          markdown.enable = true;
          html.enable = true;
          # xml
          # hrsh7th/vscode-langservers-extracted 
          # redhat-developer/yaml-language-server 
        };
      };
    };
  };

}
