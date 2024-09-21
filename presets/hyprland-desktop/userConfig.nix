{ config, pkgs, ...}:

{
    imports = [
        ../../modules/user/stylix/poimandres.nix
        ../../modules/user/bash.nix
        ../../modules/user/neovim.nix
        ../../modules/user/firefox.nix
        ../../modules/user/hyprland/hyprland-desktop.nix
        ../../modules/user/kitty/kitty.nix
        ../../modules/user/waybar/desktop-hyprland.nix
        ../../modules/user/mako.nix
        ../../modules/user/desktop-utility.nix
        ../../modules/user/programming.nix
        ../../modules/user/video-editing.nix
        ../../modules/user/pentest.nix
    ];

    nixpkgs.config.allowUnfree = true;

    home.username = "mat";
    home.homeDirectory = "/home/mat";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.05"; # Please read the comment before changing.

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
