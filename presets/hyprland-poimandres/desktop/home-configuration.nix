{ config, pkgs, ...}:

{
    imports = [
        ../../bundles/user/base.nix
        ../../bundles/user/hyprland-desktop.nix
        ../../../modules/user/stylix/poimandres.nix
        ../../../modules/user/video-editing.nix
    ];
}
