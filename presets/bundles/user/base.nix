{ config, pkgs, ... }:

{
    #
    #   HOME-MANAGER
    #

    # Enable unfree home-manager packages
    nixpkgs.config.allowUnfree = true;

    # Set user
    home.username = "mat";
    home.homeDirectory = "/home/mat";

    # Check home manager release notes before changing the version
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;

    #
    #   PACKAGES
    #

    imports = let
        modules = ../../../modules/user; # The path to user modules
    in [
        (modules + "/bash.nix")
        (modules + "/desktop-utility.nix")
        (modules + "/neovim.nix")
        (modules + "/firefox.nix")
        (modules + "/kitty/kitty.nix")
        (modules + "/git.nix")
        (modules + "/programming.nix")
        (modules + "/pentest.nix")
    ];
}
