{ config, pkgs, ...}:

{
    imports = [
        ../../bundles/user/base.nix
        ../../bundles/user/hyprland-laptop.nix
        ../../../modules/user/stylix/poimandres.nix
    ];
}
