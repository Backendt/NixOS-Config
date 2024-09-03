{ config, pkgs, ... }:

{
    imports = [
        ./common.nix
        ./overrides/poimandres/neovim.nix
    ];

    stylix = {
        image = ./wallpapers/mountain.jpg;
        base16Scheme = ./styles/poimandres.yaml;

        opacity = {
            terminal = 0.7;
            desktop = 0.4;
        };
    };
}
