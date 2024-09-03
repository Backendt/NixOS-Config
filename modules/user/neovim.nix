{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;

        plugins = with pkgs.vimPlugins; [
            lualine-nvim
            {
                plugin = ale;
                config = "let g:ale_completion_enabled = 1";
            }
            {
                plugin = vim-hexokinase;
                config = "let g:Hexokinase_highlighters = ['virtual']";
            }
        ];

        extraLuaConfig = ''
            require('lualine').setup()
        '';

        extraConfig = ''
            set nocompatible

            filetype on
            filetype plugin on
            filetype indent on
            syntax on

            set rnu
            set nu

            set shiftwidth=4
            set tabstop=4
            set expandtab

            set guicursor=

            set incsearch
            set ignorecase
            set encoding=utf-8
            set nowrap
        '';
    };
}
