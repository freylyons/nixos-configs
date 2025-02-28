{config, lib, pkgs, ... }:
let
    package = "neovim";
in
{
    options = {
        ${package}.enable = lib.mkEnableOption "Activate the ${package} home-manager configuration";
    };

    config = lib.mkIf config.${package}.enable {
        programs.${package} =
        let
          toLua = str: "lua << EOF\n${str}\nEOF\n";
          toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
        in
        {
            enable = true;

            # point aliases for vim to neovim
            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;

            extraLuaConfig = ''
                 ${builtins.readFile ./neovim/options.lua}
				 
				 -- set the terminal to kitty
				 vim.env.TERMINAL = 'kitty --no-session'
            '';

            plugins = with pkgs.vimPlugins; [

                lualine-nvim
                nvim-web-devicons

                {
                    plugin = gruvbox-nvim;
                    config = "colorscheme gruvbox";
                }

                {
                    plugin = comment-nvim;
                    config = toLua "require(\"Comment\").setup()";
                }

                {
                    plugin = nvim-lspconfig;
                    config = toLuaFile ./neovim/plugin/lsp.lua;
                }

                {
                    plugin = nvim-cmp;
                    config = toLuaFile ./neovim/plugin/cmp.lua;
                }
                cmp-nvim-lsp
                cmp_luasnip
                luasnip
                friendly-snippets

                {
                    plugin = telescope-nvim;
                    config = toLuaFile ./neovim/plugin/telescope.lua;
                }

                telescope-fzf-native-nvim

                (nvim-treesitter.withPlugins (p: [
                    p.tree-sitter-nix
                    p.tree-sitter-vim
                    p.tree-sitter-bash
                    p.tree-sitter-lua
                    p.tree-sitter-python
                    p.tree-sitter-json
                ]))

            ];
        };
    };
}
