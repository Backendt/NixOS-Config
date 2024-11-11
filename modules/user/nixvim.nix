{ config, inputs, pkgs, ... }:

{
    imports = [ inputs.nixvim.homeManagerModules.nixvim ];

    programs.nixvim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;

        globals = {
            mapleader = " ";
        };

        plugins = {
            lsp = {
                enable = true;
                servers = {
                    #eslint.enable = true; # JavaScript
                    dockerls.enable = true;
                    #html.enable = true;
                    #cssls.enable = true;
                    bashls.enable = true;
                    #jsonls.enable = true;
                    nixd.enable = true; # Nix
                    pyright.enable = true; # Python
                    sqls.enable = true; # SQL
                    rust-analyzer = {
                        enable = true;
                        installCargo = true;
                        installRustc = true;
                    };
                };
                keymaps.diagnostic = {
                    "<leader><Right>" = "goto_next";
                    "<leader><Left>" = "goto_prev";
                };
            };
            
            lualine.enable = true;
            
            # Highlighting
            treesitter = {
                enable = true;
                indent = true;
            };

            # Completion
            cmp = {
                enable = true;
                autoEnableSources = true;
                settings.sources = [
                    { name = "nvim_lsp"; }
                    { name = "path"; }
                    { name = "buffer"; }
                ];
            };

            gitgutter.enable = true;
        };

        opts = {
            # Display
            guicursor = "";
            number = true;
            relativenumber = true;
            wrap = false;
            scrolloff = 8;

            # Indent
            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            smartindent = true;

            # Search
            incsearch = true;
            ignorecase = true;
        };
    };
}
