{ inputs, ... }:

{
    # TODO Replace Nixvim with Neovim
    imports = [ inputs.nixvim.homeManagerModules.nixvim ];

    programs.nixvim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;

        globals.mapleader = " ";

        plugins = {
            lsp = {
                enable = true;
                servers = {
                    dockerls.enable = true;
                    bashls.enable = true;
                    nixd.enable = true; # Nix
                    pyright.enable = true; # Python
                    sqls.enable = true; # SQL
                    rust-analyzer = {
                        enable = true;
                        installCargo = false;
                        installRustc = false;
                    };
                };
                keymaps = {
                    diagnostic = {
                        "<leader><Right>" = "goto_next";
                        "<leader><Left>" = "goto_prev";
                    };
                    lspBuf = {
                        "gd" = "definition";
                        "gD" = "references";
                        "gt" = "type_definition";
                        "gi" = "implementation";
                    };
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
                settings.mapping = { # From MikaelFangel's nixvim config
                    "<C-n>" = "cmp.mapping.select_next_item()";
                    "<C-p>" = "cmp.mapping.select_prev_item()";
                    "<C-j>" = "cmp.mapping.select_next_item()";
                    "<C-k>" = "cmp.mapping.select_prev_item()";
                    "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                    "<C-f>" = "cmp.mapping.scroll_docs(4)";
                    "<C-Space>" = "cmp.mapping.complete()";
                    "<S-Tab>" = "cmp.mapping.close()";
                    "<Tab>" =
                    # lua 
                    ''
                      function(fallback)
                        local line = vim.api.nvim_get_current_line()
                        if line:match("^%s*$") then
                          fallback()
                        elseif cmp.visible() then
                          cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                        else
                          fallback()
                        end
                      end
                    '';
                    "<Down>" =
                    # lua
                    ''
                      function(fallback)
                        if cmp.visible() then
                          cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                        else
                          fallback()
                        end
                      end
                    '';
                    "<Up>" =
                    # lua
                    ''
                      function(fallback)
                        if cmp.visible() then
                          cmp.select_prev_item()
                        elseif require("luasnip").jumpable(-1) then
                          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                        else
                          fallback()
                        end
                      end
                    '';
                };
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
