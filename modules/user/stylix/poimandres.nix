{ config, pkgs, ... }:

{
    imports = [ ./common.nix ];

    stylix = {
        image = ./wallpapers/mountain.jpg;
        base16Scheme = ./styles/poimandres.yaml;

        targets.neovim.enable = false;

        opacity = {
            terminal = 0.7;
            desktop = 0.4;
        };
    };
}
